@256
D=A
@0
M=D
@_1
D=A
@R13
M=D
@13
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@1
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@3
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@4
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@0
D=M
@5
D=D-A
@R13
M=D
@13
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@2
M=D
@0
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@1
M=D
@Sys.init
D;JMP
(_1)
(Main.fibonacci)
@0
D=A
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=A
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
A=A-1
D=M-D
M=-1
@label1
D;JLT
@0
A=M-1
M=0
(label1)
@0
AM=M-1
D=M
@IF_TRUE
D;JGT
@IF_FALSE
D;JMP
(IF_TRUE)
@2
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
D=D+A
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
@2
D=M
@1
D=D+A
@0
M=D
@1
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@13
M=D
@5
D=A
@13
D=M-D
@14
M=D
@13
D=M
@1
D=D-A
A=D
D=M
@4
M=D
@13
D=M
@2
D=D-A
A=D
D=M
@3
M=D
@13
D=M
@3
D=D-A
A=D
D=M
@2
M=D
@13
D=M
@4
D=D-A
A=D
D=M
@1
M=D
@13
D=M
@1
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
D=D+A
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
(IF_FALSE)
@2
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=A
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
A=A-1
M=M-D
@_3
D=A
@R13
M=D
@13
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@1
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@3
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@4
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@0
D=M
@6
D=D-A
@R13
M=D
@13
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@2
M=D
@0
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@1
M=D
@Main.fibonacci
D;JMP
(_3)
@2
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@1
D=A
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
A=A-1
M=M-D
@_4
D=A
@R13
M=D
@13
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@1
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@3
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@4
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@0
D=M
@6
D=D-A
@R13
M=D
@13
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@2
M=D
@0
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@1
M=D
@Main.fibonacci
D;JMP
(_4)
@0
AM=M-1
D=M
A=A-1
M=M+D
@2
D=M
@0
D=D+A
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
@2
D=M
@1
D=D+A
@0
M=D
@1
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@13
M=D
@5
D=A
@13
D=M-D
@14
M=D
@13
D=M
@1
D=D-A
A=D
D=M
@4
M=D
@13
D=M
@2
D=D-A
A=D
D=M
@3
M=D
@13
D=M
@3
D=D-A
A=D
D=M
@2
M=D
@13
D=M
@4
D=D-A
A=D
D=M
@1
M=D
@13
D=M
@1
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
D=D+A
@R13
M=D
@0
AM=M-1
D=M
@R13
A=M
M=D
(Sys.init)
@0
D=A
@0
A=M
M=D
@0
M=M+1
@4
D=A
@0
A=M
M=D
@0
M=M+1
@_5
D=A
@R13
M=D
@13
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@1
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@2
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@3
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@4
D=M
@0
D=D+A
A=D
D=M
@0
A=M
M=D
@0
M=M+1
@0
D=M
@6
D=D-A
@R13
M=D
@13
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@2
M=D
@0
D=M
@0
A=D+A
D=M
@0
A=M
M=D
@0
M=M+1
@0
AM=M-1
D=M
@1
M=D
@Main.fibonacci
D;JMP
(_5)
(WHILE)
@WHILE
D;JMP
@_6
(_6)
0;JMP
