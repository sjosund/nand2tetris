@256
D=A
@SP
M=D
// Push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.LOCAL 0
@0
D=A
@1
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
(LOOP_START)
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
// Push Memory.LOCAL 0
@1
D=M
@0
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
// Pop Memory.LOCAL 0
@0
D=A
@1
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
@LOOP_START
D;JNE
// Push Memory.LOCAL 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
($$:INFINITE_LOOP)
@$$:INFINITE_LOOP
0;JMP
