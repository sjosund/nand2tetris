// Push constant 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 333
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 888
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop Memory.STATIC 8
@SP
AM=M-1
D=M
@StaticTest.vm.8
M=D
// Pop Memory.STATIC 3
@SP
AM=M-1
D=M
@StaticTest.vm.3
M=D
// Pop Memory.STATIC 1
@SP
AM=M-1
D=M
@StaticTest.vm.1
M=D
// Push Memory.STATIC, 3
@StaticTest.vm.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push Memory.STATIC, 1
@StaticTest.vm.1
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
// Push Memory.STATIC, 8
@StaticTest.vm.8
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
