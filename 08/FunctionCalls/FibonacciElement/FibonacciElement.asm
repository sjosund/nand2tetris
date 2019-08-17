@256
D=A
@SP
M=D
// Calling Sys.init
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
@Sys.init
0;JMP
($$return.3)
// function Main.fibonacci 0
(Main.fibonacci)
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
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
// Check for lt
@SP
AM=M-1
D=M
@SP
AM=M-1
D=M-D
M=-1
@$$lt.0
D;JLT
@SP
A=M
M=0
($$lt.0)
@SP
M=M+1
// if-goto IF_TRUE
@SP
AM=M-1
D=M
@IF_TRUE
D;JNE
// goto IF_FALSE
@IF_FALSE
0;JMP
// label IF_TRUE
(IF_TRUE)
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
// label IF_FALSE
(IF_FALSE)
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
// push constant 2
@2
D=A
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
// call Main.fibonacci 1
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
@6
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
@Main.fibonacci
0;JMP
($$return.4)
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
// push constant 1
@1
D=A
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
// call Main.fibonacci 1
@$$return.5
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
@6
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
@Main.fibonacci
0;JMP
($$return.5)
// add
// Add
@SP
AM=M-1
D=M
@SP
AM=M-1
M=M+D
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
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Main.fibonacci 1
@$$return.6
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
@6
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
@Main.fibonacci
0;JMP
($$return.6)
// label WHILE
(WHILE)
// goto WHILE
@WHILE
0;JMP
($$:INFINITE_LOOP)
@$$:INFINITE_LOOP
0;JMP
