# TODO
# 3. call Sys.init

import os
from collections import defaultdict
from enum import Enum
from pathlib import Path

from fire import Fire

COMMENT_MARKER = '//'
AUTO_PREFIX = '$$'


class Command(Enum):
    ARITHMETIC = 1
    PUSH = 2
    POP = 3
    LABEL = 4
    GOTO = 5
    IF = 6
    FUNCTION = 7
    RETURN = 8
    CALL = 9


class Memory(Enum):
    LOCAL = 1
    ARGUMENT = 2
    THIS = 3
    THAT = 4
    CONSTANT = 5
    STATIC = 6
    TEMP = 7
    POINTER = 8


ONE_ARG_COMMANDS = [Command.ARITHMETIC]
TWO_ARG_COMMANDS = [Command.POP, Command.PUSH, Command.FUNCTION]


def translate(path, output_path, force_overwrite=False):
    writer = CodeWriter(output_path, force_overwrite=force_overwrite)
    writer.bootstrap()
    for line, current_path in Parser.lines(path):
        command_type = Parser.command_type(line)

        args = {
            'arg1': Parser.arg1(line, command_type=command_type),
            'arg2': Parser.arg2(line)
        }

        writer.write(command_type=command_type, filename=current_path, line=line, **args)
    writer.inf_loop()


class CodeWriter:
    counter = defaultdict(int)
    location2address = {
        Memory.LOCAL: 1,
        Memory.ARGUMENT: 2,
        Memory.THIS: 3,
        Memory.THAT: 4,
    }

    def __init__(self, path: str, force_overwrite: bool):
        self.path = path
        self.input_filename = None
        if Path(self.path).exists():
            if force_overwrite:
                os.remove(self.path)
            else:
                raise FileExistsError

    def write(self, command_type: Command, filename: str, line: str, arg1: str = None, arg2: str = None):
        self.input_filename = filename
        self._write(f'{COMMENT_MARKER} {line}')
        if command_type == Command.ARITHMETIC:
            cmd = getattr(self, f'_{arg1}')()
        elif arg1 == Memory.CONSTANT:
            cmd = self.write_push_constant(i=arg2)
        else:
            if command_type == Command.PUSH:
                cmd = self.write_push(location=arg1, i=arg2)
            elif command_type == Command.POP:
                cmd = self.write_pop(location=arg1, i=arg2)
            elif command_type == Command.FUNCTION:
                cmd = self.write_function(name=arg1, n_args=arg2)
            elif command_type == Command.LABEL:
                cmd = self.write_label(label=arg1)
            elif command_type == Command.IF:
                cmd = self.write_if_goto(label=arg1)
            elif command_type == Command.GOTO:
                cmd = self.write_goto(label=arg1)
            elif command_type == Command.RETURN:
                self.write_return()
                cmd = []
            elif command_type == Command.CALL:
                self.write_call(function_name=arg1, n_args=arg2)
                cmd = []
            else:
                raise ValueError(command_type)
        if cmd:
            self._write(cmd)

    def _write(self, cmd):
        with open(self.path, 'a+') as f:
            if isinstance(cmd, list):
                for c in cmd:
                    f.write(f'{c}\n')
            else:
                f.write(f'{cmd}\n')

    @staticmethod
    def write_push_constant(i):
        cmd = [
                  # f'// Push constant {i}',
                  f'@{i}',
                  'D=A',
                  '@SP',
                  'A=M',
                  'M=D'
              ] + CodeWriter._increase_stack_pointer()
        return cmd

    def write_push(self, location, i):
        location2cmd = defaultdict(
            lambda: self._push_standard, {
                Memory.STATIC: self._push_static,
                Memory.POINTER: self._push_pointer,
                Memory.TEMP: self._push_temp,
            })
        cmd = location2cmd[location](location=location, i=i)
        return cmd

    @staticmethod
    def _push_standard(location, i):
        cmd = [
                  # f'// Push {location} {i}',
                  f'@{CodeWriter.location2address[location]}',
                  'D=M',
                  f'@{i}',
                  'A=D+A',
              ] + CodeWriter.M_to_stack()
        return cmd

    @staticmethod
    def _push_temp(location, i):
        return CodeWriter._push_direct_access(
            i=i, command='temp', base_address=5,  # TODO Break out to constant
        )

    @staticmethod
    def _push_pointer(location, i):
        return CodeWriter._push_direct_access(
            i=i, command='pointer', base_address=3,  # TODO Break out to constant
        )

    @staticmethod
    def _push_direct_access(base_address, i, command):
        cmd = [
                  # f'// Push {command} {i}',
                  f'@{base_address + i}',
              ] + CodeWriter.M_to_stack()
        return cmd

    def _push_static(self, location, i):
        symbol = self._static_symbol(i)
        cmd = [  # f'// Push {location}, {i}',
                  f'@{symbol}'] + CodeWriter.M_to_stack()
        return cmd

    @staticmethod
    def M_to_stack():
        return ['D=M', '@SP', 'A=M', 'M=D'] + CodeWriter._increase_stack_pointer()

    def write_pop(self, location, i):
        location2cmd = defaultdict(
            lambda: self._pop_standard, {
                Memory.STATIC: self._pop_static,
                Memory.POINTER: self._pop_pointer,
                Memory.TEMP: self._pop_temp,
            })
        cmd = [f'// Pop {location} {i}'] + location2cmd[location](location=location, i=i)
        return cmd

    @staticmethod
    def _pop_standard(location, i):
        return [f'@{i}', 'D=A', f'@{CodeWriter.location2address[location]}', 'D=M+D', '@R13',
                'M=D'] + CodeWriter._pop_stack_to('D') + ['@R13', 'A=M', 'M=D']

        # return CodeWriter._pop_stack_to('D') + \
        #        CodeWriter._memory_to_location(location=location, i=i)

    def _pop_temp(self, location, i):
        return CodeWriter._pop_stack_to('D') + CodeWriter._pop_direct_access(address=5 + i)

    def _pop_pointer(self, location, i):
        return CodeWriter._pop_stack_to('D') + CodeWriter._pop_direct_access(address=3 + i)

    @staticmethod
    def _memory_to_location(location, i):
        cmd = [f'@{CodeWriter.location2address[location]}', 'A=M', 'M=D']
        return cmd

    @staticmethod
    def _pop_direct_access(address):
        cmd = [f'@{address}', 'M=D']
        return cmd

    def _pop_static(self, location, i):
        cmd = CodeWriter._pop_stack_to('D') + [f'@{self._static_symbol(i)}', 'M=D']
        return cmd

    def _static_symbol(self, i):
        return f'{self.input_filename.stem}.{i}'

    def write_function(self, name, n_args):
        # TODO Static segment should be the file's one
        # function_full_name = f'{filename}.{name}'
        function_full_name = name
        # self._write(f'{COMMENT_MARKER} Function')
        self._write(f'({function_full_name})')
        for _ in range(n_args):
            self._write(CodeWriter.write_push_constant(i=0))

    def write_call(self, function_name, n_args):
        print(function_name)
        label = self.unique_label(key='return')
        self._write(self.write_push_constant(label))

        for addr in ['LCL', 'ARG', 'THIS', 'THAT']:
            self._write(f'{COMMENT_MARKER} Saves {addr} from caller')
            self._write(f'@{addr}')
            self._write(self.M_to_stack())

        self._write(f'{COMMENT_MARKER} Repositions ARG')
        self._write(f'@{5 + n_args}')
        self._write('D=A')
        self._write('@SP')
        self._write('D=M-D')
        self._write('@ARG')
        self._write('M=D')

        self._write(f'{COMMENT_MARKER} Repositions LCL')
        self._write('@SP')
        self._write('D=M')
        self._write('@LCL')
        self._write('M=D')

        self._write(self.write_goto(label=function_name))

        self._write(self.write_label(label))

    def write_return(self):
        # Store endframe
        # self._write(f'{COMMENT_MARKER} Return')
        endframe = 'R13'
        self._write('@LCL')
        self._write('D=M')
        self._write(f'@{endframe}')
        self._write('M=D')

        # Get return address
        retaddr = 'R14'
        self._write('@5')
        self._write('A=D-A')
        self._write('D=M')
        self._write(f'@{retaddr}')
        self._write('M=D')

        # Repositions return value for caller
        self._write(self._pop_stack_to('D'))
        self._write('@ARG')
        self._write('A=M')
        self._write('M=D')

        # Repositions SP of the caller
        self._write('@ARG')
        self._write('D=M+1')
        self._write('@SP')
        self._write('M=D')

        # Restores THAT, THIS, ARG, LCL
        for i, addr in enumerate(['THAT', 'THIS', 'ARG', 'LCL'], start=1):
            self._write(f'@{i}')
            self._write('D=A')
            self._write(f'@{endframe}')
            self._write('A=M-D')
            self._write('D=M')
            self._write(f'@{addr}')
            self._write('M=D')

        self._write(f'@{retaddr}')
        self._write('A=M')
        self._write('0;JMP')

    @staticmethod
    def _add():
        cmd = ['// Add'] + CodeWriter._pop_stack_to('D') + CodeWriter._pop_stack_to(None) + [
            'M=M+D'] + CodeWriter._increase_stack_pointer()
        return cmd

    @staticmethod
    def _sub():
        cmd = ['// Sub'] + CodeWriter._pop_stack_to('D') + CodeWriter._pop_stack_to(None) + [
            'M=M-D'] + CodeWriter._increase_stack_pointer()
        return cmd

    @staticmethod
    def _neg():
        cmd = ['// Negate'] + CodeWriter._pop_stack_to(None) + ['M=-M'] + CodeWriter._increase_stack_pointer()
        return cmd

    @classmethod
    def boolean_check(cls, op: str):
        if op not in ['eq', 'lt', 'gt']:
            raise ValueError(f'{op} not allowed op')
        op2jump = {
            'eq': 'JEQ',
            'gt': 'JGT',
            'lt': 'JLT'
        }
        label = cls.unique_label(op)
        cmd = [f'// Check for {op}'] + CodeWriter._pop_stack_to('D') + CodeWriter._pop_stack_to() + [
            'D=M-D',
            'M=-1',  # Preliminary put true on the stack, in case eq.
            f'@{label}',
            f'D;{op2jump[op]}',
            '@SP',
            'A=M',
            'M=0',
            f'({label})',
        ] + CodeWriter._increase_stack_pointer()
        return cmd

    @classmethod
    def _eq(cls):
        return cls.boolean_check('eq')

    @classmethod
    def _lt(cls):
        return cls.boolean_check('lt')

    @classmethod
    def _gt(cls):
        return cls.boolean_check('gt')

    @staticmethod
    def _and():
        cmd = ['// Check And'] + CodeWriter._pop_stack_to('D') + CodeWriter._pop_stack_to() + [
            'M=M&D'] + CodeWriter._increase_stack_pointer()
        return cmd

    @staticmethod
    def _or():
        cmd = ['// Check or'] + CodeWriter._pop_stack_to('D') + CodeWriter._pop_stack_to() + [
            'M=M|D'] + CodeWriter._increase_stack_pointer()
        return cmd

    @staticmethod
    def _not():
        cmd = ['// Boolean not'] + CodeWriter._pop_stack_to() + ['M=!M'] + CodeWriter._increase_stack_pointer()
        return cmd

    @classmethod
    def unique_label(cls, key, prefix=True):  # TODO Extend defaultdict instead
        n = cls.counter[key]
        cls.counter[key] += 1
        prefix = AUTO_PREFIX if prefix else ''
        label = f'{prefix}{key}.{n}'
        return label

    @staticmethod
    def _pop_stack_to(dst=None):
        ret = [
            '@SP',
            'AM=M-1',
        ]
        if dst is not None:
            ret += [f'{dst}=M']
        return ret

    @staticmethod
    def _increase_stack_pointer():
        return [
            '@SP',
            'M=M+1'
        ]

    @staticmethod
    def _decrease_stack_pointer():
        return [
            '@SP',
            'M=M-1'
        ]

    @staticmethod
    def write_label(label):
        return [  # f'{COMMENT_MARKER} Write label',
            f'({label})']

    @staticmethod
    def write_goto(label):
        return [  # f'{COMMENT_MARKER} GOTO {label}',
            f'@{label}', '0;JMP']

    def write_if_goto(self, label):
        # return [f'{COMMENT_MARKER} IF-GOTO'] +\
        return self._pop_stack_to('D') + [f'@{label}', 'D;JNE']

    def bootstrap(self):
        self._write('@256')
        self._write('D=A')
        self._write('@SP')
        self._write('M=D')
        self._write(f'{COMMENT_MARKER} Calling Sys.init')
        self.write_call(function_name='Sys.init', n_args=0)
        # TODO Call Sys.init

    def inf_loop(self):
        loop_label = f'{AUTO_PREFIX}:INFINITE_LOOP'
        self._write(f'({loop_label})')
        self._write(f'@{loop_label}')
        self._write('0;JMP')


class Parser:
    @staticmethod
    def lines(path):
        path = Path(path)
        if path.is_file():
            with open(path) as f:
                for line in f:
                    if not Parser.is_whitespace(line):
                        yield Parser.strip_whitespace(line), path
        elif path.is_dir():
            for p in path.glob('*.vm'):
                with open(p) as f:
                    for line in f:
                        if not Parser.is_whitespace(line):
                            yield Parser.strip_whitespace(line), p

    @staticmethod
    def is_whitespace(line: str) -> bool:
        if not Parser.strip_whitespace(line):
            return True
        return False

    @staticmethod
    def strip_whitespace(line: str) -> str:
        if COMMENT_MARKER in line:
            line = line[:line.index(COMMENT_MARKER)]
        parts = line.replace('\t', '').replace('\n', '').split(' ')
        parts = [p for p in parts if len(p)]
        line = ' '.join(parts)
        return line

    @staticmethod
    def command_type(line):
        parts = line.split(' ')
        command_mapping = {
            'push': Command.PUSH,
            'pop': Command.POP,
            'add': Command.ARITHMETIC,
            'sub': Command.ARITHMETIC,
            'eq': Command.ARITHMETIC,
            'neg': Command.ARITHMETIC,
            'not': Command.ARITHMETIC,
            'lt': Command.ARITHMETIC,
            'gt': Command.ARITHMETIC,
            'and': Command.ARITHMETIC,
            'or': Command.ARITHMETIC,
            'function': Command.FUNCTION,
            'label': Command.LABEL,
            'if-goto': Command.IF,
            'goto': Command.GOTO,
            'return': Command.RETURN,
            'call': Command.CALL,
        }
        return command_mapping[parts[0]]

    @staticmethod
    def arg1(line, command_type):
        parts = line.split(' ')
        if command_type == Command.ARITHMETIC:
            ret = parts[0]
        elif command_type in [Command.POP, Command.PUSH]:
            ret = Memory[parts[1].upper()]
        elif len(parts) >= 2:
            ret = parts[1]
        else:
            ret = None

        return ret

    @staticmethod
    def arg2(line):
        parts = line.split(' ')
        if len(parts) == 3:
            ret = int(line.split(' ')[2])
        else:
            ret = ''
        return ret


if __name__ == '__main__':
    Fire(translate)
