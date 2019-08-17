import os

from fire import Fire

L_COMMAND = 'l_command'
A_COMMAND = 'a_command'
C_COMMAND = 'c_command'

COMMENT_MARKER = '//'

PREDEFINED_SYMBOLS = {f'R{i}': i for i in range(16)}
PREDEFINED_SYMBOLS.update({
    'SCREEN': 16384,
    'KBD': 24576,
    'SP': 0,
    'LCL': 1,
    'ARG': 2,
    'THIS': 3,
    'THAT': 4
})


class Assembler:
    def __init__(self):
        self.symbol_table = SymbolTable(**PREDEFINED_SYMBOLS)

    def assemble(self, path, output, force):
        self.check_output(output, force)
        self.first_pass(path)
        self.second_pass(path, output)

    @staticmethod
    def check_output(path, force):
        if os.path.exists(path):
            if not force:
                remove = input(f'{path} exists, remove? (y/n)')
                if remove.lower() == 'y':
                    os.remove(path)
                else:
                    raise FileExistsError
            else:
                os.remove(path)

    def first_pass(self, path):
        line_gen = Parser.advance(path)
        line_number = 0
        for line in line_gen:
            if Parser.command_type(line) == L_COMMAND:
                self.symbol_table.add_entry(symbol=Parser.symbol(line), i=line_number)
            else:
                line_number += 1

    def second_pass(self, path, output):
        n = 16
        line_gen = Parser.advance(path)
        for line in line_gen:
            command_type = Parser.command_type(line)
            if command_type == L_COMMAND:
                continue
            elif command_type == A_COMMAND:
                if Parser.is_symbolic(line):
                    symbol = Parser.symbol(line)
                    if symbol not in self.symbol_table:
                        self.symbol_table.add_entry(symbol=symbol, i=n)
                        n += 1
                    line = f'@{self.symbol_table[symbol]}'
                self.write(Parser.parse_A(line), output)
            elif command_type == C_COMMAND:
                self.write(Parser.parse_C(line), output)

    def write(self, line, output):
        with open(output, 'a+') as f:
            f.write(f'{line}\n')


class Parser:
    def __init__(self, path):
        self.path = path
        self.current_line = None

    @staticmethod
    def advance(path):
        with open(path) as f:
            for line in f:
                if not Parser.is_whitespace(line):
                    yield Parser.strip_whitespace(line)

    @staticmethod
    def is_whitespace(line):
        if not Parser.strip_whitespace(line):
            return True
        return False

    @staticmethod
    def strip_whitespace(line):
        if COMMENT_MARKER in line:
            line = line[:line.index(COMMENT_MARKER)]
        line = line.replace(' ', '').replace('\t', '').replace('\n', '')
        return line

    @staticmethod
    def command_type(line):
        line = Parser.strip_whitespace(line)
        if Parser.is_label(line):
            type_ = L_COMMAND
        elif Parser.is_address(line):
            type_ = A_COMMAND
        else:
            type_ = C_COMMAND
        return type_

    @staticmethod
    def is_label(line):
        line = Parser.strip_whitespace(line)
        if line.startswith('(') and line.endswith(')'):
            return True
        else:
            return False

    @staticmethod
    def is_address(line):
        return line.startswith('@')

    @staticmethod
    def symbol(line):
        line = Parser.strip_whitespace(line)
        if Parser.is_address(line):
            return line[1:]
        elif Parser.is_label(line):
            return line[1:-1]
        else:
            raise ValueError

    @staticmethod
    def parse_A(line):
        line = Parser.strip_whitespace(line)
        line = line[1:]
        val = int(line)
        val = format(val, '015b')
        val = f'0{val}'
        return val

    @staticmethod
    def parse_C(line):
        line = Parser.strip_whitespace(line)
        comp = Code.comp(line)
        dest = Code.dest(line)
        jump = Code.jump(line)
        code = f'111{comp}{dest}{jump}'
        return code

    @staticmethod
    def is_symbolic(line):
        try:
            int(line[1:])
            return False
        except ValueError:
            return True


class Code:
    TRANSLATION_TABLE_COMMON = {
        '0': '101010',
        '1': '111111',
        '-1': '111010',
        'D': '001100',
        '!D': '001101',
        '-D': '001111',
        'D+1': '011111',
        'D-1': '001110'
    }
    TRANSLATION_TABLE_A0 = {
        'A': '110000',
        '!A': '110001',
        '-A': '110011',
        'A+1': '110111',
        'A-1': '110010',
        'D+A': '000010',
        'A+D': '000010',
        'D-A': '010011',
        'A-D': '000111',
        'D&A': '000000',
        'A&D': '000000',
        'D|A': '010101',
        'A|D': '010101'
    }
    TRANSLATION_TABLE_A1 = {
        'M': '110000',
        '!M': '110001',
        '-M': '110011',
        'M+1': '110111',
        'M-1': '110010',
        'D+M': '000010',
        'M+D': '000010',
        'D-M': '010011',
        'M-D': '000111',
        'D&M': '000000',
        'M&D': '000000',
        'D|M': '010101',
        'M|D': '010101',
    }

    TRANSLATION_TABLE_JUMP = {
        'JGT': '001',
        'JEQ': '010',
        'JGE': '011',
        'JLT': '100',
        'JNE': '101',
        'JLE': '110',
        'JMP': '111'
    }

    @staticmethod
    def comp(line):
        if '=' in line:
            line = line[line.index('=') + 1:]
        if ';' in line:
            line = line[:line.index(';')]

        if line in Code.TRANSLATION_TABLE_COMMON:
            code = f'0{Code.TRANSLATION_TABLE_COMMON[line]}'
        elif line in Code.TRANSLATION_TABLE_A0:
            code = f'0{Code.TRANSLATION_TABLE_A0[line]}'
        elif line in Code.TRANSLATION_TABLE_A1:
            code = f'1{Code.TRANSLATION_TABLE_A1[line]}'
        else:
            raise ValueError(line)

        return code

    @staticmethod
    def dest(line):
        if '=' in line:
            dst = line[:line.index('=')]
            dst = {
                'M': '001',
                'D': '010',
                'MD': '011',
                'A': '100',
                'AM': '101',
                'AD': '110',
                'AMD': '111'
            }[dst]
        else:
            dst = '000'
        return dst

    @staticmethod
    def jump(line):
        if ';' in line:
            line = line[line.index(';') + 1:]
            jmp = Code.TRANSLATION_TABLE_JUMP[line]
        else:
            jmp = '000'
        return jmp


class SymbolTable(dict):
    def add_entry(self, symbol, i):
        self[symbol] = i


if __name__ == '__main__':
    assembler = Assembler()
    Fire(assembler)
    # assembler.assembel(
    #     path='/Users/user/Programming/nand2tetris/tmp/sub.asm',
    #     output='/Users/user/Programming/nand2tetris/tmp/sub.hack')
