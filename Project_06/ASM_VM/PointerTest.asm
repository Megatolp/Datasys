// Push constant 3030
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop pointer 0
@THIS
D=A
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
// Push constant 3040
@3040
D=A
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
// Push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop this 2
@THIS
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
// Push constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop that 6
@THAT
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
// Push pointer 0
@This
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push pointer 1
@This
D=A
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
// Push this 2
@THIS
D=M
@2
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
// Push that 6
@THAT
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
@_1
(_1)
0;JMP