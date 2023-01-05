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
// Pop static 8
@StaticTest.8
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Pop static 3
@StaticTest.3
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Pop static 1
@StaticTest.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Push static 3
@StaticTest.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push static 1
@StaticTest.1
D=M
@SP
A=M
M=D
@SP
M=M+1
//sub
@SP
AM=M-1
D=M
A=A-1
M=M-D

// Push static 8
@StaticTest.8
D=M
@SP
A=M
M=D
@SP
M=M+1
//add
@SP
AM=M-1
D=M
A=A-1
M=M+D

@_1
(_1)
0;JMP
