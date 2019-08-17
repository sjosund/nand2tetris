from unittest import TestCase

from assembler import Parser, Code


class TestAssembler(TestCase):
    pass


class TestParser(TestCase):
    def test_is_whitespace(self):
        self.assertTrue(Parser.is_whitespace('     '))
        self.assertTrue(Parser.is_whitespace(''))
        self.assertTrue(Parser.is_whitespace('// a comment'))
        self.assertFalse(Parser.is_whitespace('@i'))
        self.assertFalse(Parser.is_whitespace('A=M+D'))
        self.assertFalse(Parser.is_whitespace('  @asd   '))


class TestCode(TestCase):
    def test_comp(self):
        self.assertEqual(Code.comp('A=0'), '0101010')
        self.assertEqual(Code.comp('A=0;JGE'), '0101010')
        self.assertEqual(Code.comp('A=1;JGE'), '0111111')
        self.assertEqual(Code.comp('M=-1;JEQ'), '0111010')
        self.assertEqual(Code.comp('A=D;JGE'), '0001100')
        self.assertEqual(Code.comp('M=A;JGE'), '0110000')
        self.assertEqual(Code.comp('D=M;JGE'), '1110000')

    def test_jump(self):
        self.assertEqual(Code.jump('A=0'), '000')
        self.assertEqual(Code.jump('A=0;JGT'), '001')
        self.assertEqual(Code.jump('A=0;JEQ'), '010')
        self.assertEqual(Code.jump('A=0;JGE'), '011')
        self.assertEqual(Code.jump('A=0;JLT'), '100')
        self.assertEqual(Code.jump('A=0;JNE'), '101')
        self.assertEqual(Code.jump('A=0;JLE'), '110')
        self.assertEqual(Code.jump(';JMP'), '111')
