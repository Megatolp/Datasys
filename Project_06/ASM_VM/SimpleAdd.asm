// Push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 8
@8
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
@_1
(_1)
0;JMP
