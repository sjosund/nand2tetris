// Function
(SimpleFunction.test)
// Push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 0
@0
D=A
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
// Push Memory.LOCAL 1
@1
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
// Boolean not
@SP
AM=M-1
M=!M
@SP
M=M+1
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
// Add
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M+D
@SP
M=M+1
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
// Sub
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M-D
@SP
M=M+1
// Return
@LCL
D=M
@R13
M=D
@5
D=D-A
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@1
D=A
@R13
A=M-D
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
($$:INFINITE_LOOP)
@$$:INFINITE_LOOP
0;JMP
