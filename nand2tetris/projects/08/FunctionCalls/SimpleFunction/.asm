@256
D=A
@0
M=D

// Call Sys.init 0
@Sys.init$ret_1
D=A
@SP
A=M
M=D
@0
M=M+1
@LCL
D=M
@SP
A=M
M=D
@0
M=M+1
@ARG
D=M
@SP
A=M
M=D
@0
M=M+1
@THIS
D=M
@SP
A=M
M=D
@0
M=M+1
@THAT
D=M
@SP
A=M
M=D
@0
M=M+1
@5
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP

// Label Sys.init$ret_1
(Sys.init$ret_1)
// Function SimpleFunction.test 2
// Label SimpleFunction.test
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
// Push local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push local 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add 
@0
AM=M-1
D=M
A=A-1
M=M+D
// not 
@0
A = M-1
M=!M
// Push argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add 
@0
AM=M-1
D=M
A=A-1
M=M+D
// Push argument 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub 
@0
AM=M-1
D=M
A=A-1
M=M-D
// Return
@LCL
D=M
@R14
M=D
@R14
D=M
@5
A=D-A
D=M
@R15
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M
@SP
M=D+1
@R14
D=M
@1
A=D-A
D=M
@THAT
M=D
@R14
D=M
@2
A=D-A
D=M
@THIS
M=D
@R14
D=M
@3
A=D-A
D=M
@ARG
M=D
@R14
D=M
@4
A=D-A
D=M
@LCL
M=D
@R15
A=M
0;JMP
@_2
(_2)
0;JMP