// Push constant 3030
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.POINTER 0
@SP
AM=M-1
D=M
@3
M=D
// Push constant 3040
@3040
D=A
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
// Push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.THIS 2
@2
D=A
@3
D=M+D
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Push constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.THAT 6
@6
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
// Push pointer 0
@3
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push pointer 1
@4
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
// Push Memory.THIS 2
@3
D=M
@2
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
// Push Memory.THAT 6
@4
D=M
@6
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
