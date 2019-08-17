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
// function Sys.init 0
(Sys.init)
// push constant 4000
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
// Pop Memory.POINTER 0
@SP
AM=M-1
D=M
@3
M=D
// push constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
// Pop Memory.POINTER 1
@SP
AM=M-1
D=M
@4
M=D
// call Sys.main 0
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
@Sys.main
0;JMP
($$return.1)
// pop temp 1
// Pop Memory.TEMP 1
@SP
AM=M-1
D=M
@6
M=D
// label LOOP
(LOOP)
// goto LOOP
@LOOP
0;JMP
// function Sys.main 5
(Sys.main)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
// Pop Memory.POINTER 0
@SP
AM=M-1
D=M
@3
M=D
// push constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
// Pop Memory.POINTER 1
@SP
AM=M-1
D=M
@4
M=D
// push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
// Pop Memory.LOCAL 1
@1
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
// push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
// Pop Memory.LOCAL 2
@2
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
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
// Pop Memory.LOCAL 3
@3
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
// push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.add12 1
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
@Sys.add12
0;JMP
($$return.2)
// pop temp 0
// Pop Memory.TEMP 0
@SP
AM=M-1
D=M
@5
M=D
// push local 0
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
// push local 1
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
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
// function Sys.add12 0
(Sys.add12)
// push constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
// Pop Memory.POINTER 0
@SP
AM=M-1
D=M
@3
M=D
// push constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
// Pop Memory.POINTER 1
@SP
AM=M-1
D=M
@4
M=D
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
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
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
($$:INFINITE_LOOP)
@$$:INFINITE_LOOP
0;JMP
