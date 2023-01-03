@256
D=A
@0
M=D

// Call Sys.init 0
@_1
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

// Label _1
(_1)
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
// Pop pointer 1
@THIS
D=A
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop that 0
@THAT
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
// Push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop that 1
@THAT
D=M
@1
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
// Push constant 2
@2
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
// Label MAIN_LOOP_START
(MAIN_LOOP_START)
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
// If-goto COMPUTE_ELEMENT
@SP
AM=M-1
D=M
@COMPUTE_ELEMENT
D;JGT
// Goto END_PROGRAM
@END_PROGRAM
0;JMP
// Label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// Push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push that 1
@THAT
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
// Pop that 2
@THAT
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Push pointer 1
@THIS
D=A
@1
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
// add 
@0
AM=M-1
D=M
A=A-1
M=M+D
// Pop pointer 1
@THIS
D=A
@1
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
// Goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP
// Label END_PROGRAM
(END_PROGRAM)
@_2
(_2)
0;JMP
