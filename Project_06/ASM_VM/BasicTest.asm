// Push constant 10
@10
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
// Pop argument 2
@ARG
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
// Pop argument 1
@ARG
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
// Push constant 36
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop this 6
@THIS
D=M
@6
D=D+A
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
// Pop that 5
@THAT
D=M
@5
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
// Push constant 510
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop temp 6
@5
D=A
@6
A=D+A
D=M
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
// Push that 5
@THAT
D=M
@5
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
// Push this 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push this 6
@THIS
D=M
@6
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
// sub 
@0
AM=M-1
D=M
A=A-1
M=M-D
// Push temp 6
@11
A=M
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
@_1
(_1)
0;JMP
