// Push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Label LOOP_START
(LOOP_START)
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
// add 
@0
AM=M-1
D=M
A=A-1
M=M+D
// Pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
// Push constant 1
@1
D=A
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
// Pop argument 0
@ARG
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
// If-goto LOOP_START
@SP
AM=M-1
D=M
@LOOP_START
D;JGT
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
@_1
(_1)
0;JMP
