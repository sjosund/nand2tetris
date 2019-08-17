@256
D=A
@SP
M=D
// Push Memory.ARGUMENT 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.POINTER 1
@SP
AM=M-1
D=M
@4
M=D
// Push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.THAT 0
@0
D=A
@4
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.THAT 1
@1
D=A
@4
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Push Memory.ARGUMENT 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// Sub
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M-D
@SP
M=M+1
// Pop Memory.ARGUMENT 0
@0
D=A
@2
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Write label
(MAIN_LOOP_START)
// Push Memory.ARGUMENT 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// IF-GOTO
@SP
AM=M-1
D=M
@COMPUTE_ELEMENT
D;JNE
// GOTO
@END_PROGRAM
0;JMP
// Write label
(COMPUTE_ELEMENT)
// Push Memory.THAT 0
@4
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push Memory.THAT 1
@4
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Add
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M+D
@SP
M=M+1
// Pop Memory.THAT 2
@2
D=A
@4
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Push pointer 1
@4
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// Add
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M+D
@SP
M=M+1
// Pop Memory.POINTER 1
@SP
AM=M-1
D=M
@4
M=D
// Push Memory.ARGUMENT 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// Sub
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M-D
@SP
M=M+1
// Pop Memory.ARGUMENT 0
@0
D=A
@2
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// GOTO
@MAIN_LOOP_START
0;JMP
// Write label
(END_PROGRAM)
($$:INFINITE_LOOP)
@$$:INFINITE_LOOP
0;JMP
