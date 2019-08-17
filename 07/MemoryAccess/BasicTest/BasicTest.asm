// Push constant 10
@10
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
// Push constant 21
@21
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.ARGUMENT 2
@2
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
// Pop Memory.ARGUMENT 1
@1
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
// Push constant 36
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.THIS 6
@6
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
// Push constant 42
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.THAT 5
@5
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
// Push constant 510
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.TEMP 6
@SP
AM=M-1
D=M
@11
M=D
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
// Push Memory.THAT 5
@4
D=M
@5
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
// Push Memory.THIS 6
@3
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push Memory.THIS 6
@3
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
// Sub
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M-D
@SP
M=M+1
// Push temp 6
@11
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
