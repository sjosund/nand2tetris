@256
D=A
@SP
M=D
// Calling Sys.init
@$$return.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Saves LCL from caller
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves ARG from caller
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THIS from caller
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THAT from caller
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// Repositions ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
// Repositions LCL
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
($$return.0)
// function Class1.set 0
(Class1.set)
// push argument 0
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
// pop static 0
// Pop Memory.STATIC 0
@SP
AM=M-1
D=M
@Class1.0
M=D
// push argument 1
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
// pop static 1
// Pop Memory.STATIC 1
@SP
AM=M-1
D=M
@Class1.1
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
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
// function Class1.get 0
(Class1.get)
// push static 0
@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Class1.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
// Sub
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M-D
@SP
M=M+1
// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
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
// function Sys.init 0
(Sys.init)
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Class1.set 2
@$$return.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// Saves LCL from caller
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves ARG from caller
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THIS from caller
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THAT from caller
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// Repositions ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
// Repositions LCL
@SP
D=M
@LCL
M=D
@Class1.set
0;JMP
($$return.1)
// pop temp 0
// Pop Memory.TEMP 0
@SP
AM=M-1
D=M
@5
M=D
// push constant 23
@23
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Class2.set 2
@$$return.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// Saves LCL from caller
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves ARG from caller
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THIS from caller
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THAT from caller
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// Repositions ARG
@7
D=A
@SP
D=M-D
@ARG
M=D
// Repositions LCL
@SP
D=M
@LCL
M=D
@Class2.set
0;JMP
($$return.2)
// pop temp 0
// Pop Memory.TEMP 0
@SP
AM=M-1
D=M
@5
M=D
// call Class1.get 0
@$$return.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// Saves LCL from caller
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves ARG from caller
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THIS from caller
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THAT from caller
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// Repositions ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
// Repositions LCL
@SP
D=M
@LCL
M=D
@Class1.get
0;JMP
($$return.3)
// call Class2.get 0
@$$return.4
D=A
@SP
A=M
M=D
@SP
M=M+1
// Saves LCL from caller
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves ARG from caller
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THIS from caller
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// Saves THAT from caller
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// Repositions ARG
@5
D=A
@SP
D=M-D
@ARG
M=D
// Repositions LCL
@SP
D=M
@LCL
M=D
@Class2.get
0;JMP
($$return.4)
// label WHILE
(WHILE)
// goto WHILE
@WHILE
0;JMP
// function Class2.set 0
(Class2.set)
// push argument 0
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
// pop static 0
// Pop Memory.STATIC 0
@SP
AM=M-1
D=M
@Class2.0
M=D
// push argument 1
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
// pop static 1
// Pop Memory.STATIC 1
@SP
AM=M-1
D=M
@Class2.1
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
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
// function Class2.get 0
(Class2.get)
// push static 0
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Class2.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
// Sub
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M-D
@SP
M=M+1
// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
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
