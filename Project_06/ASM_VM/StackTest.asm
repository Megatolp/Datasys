// Push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq 
// Push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq 
// Push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq 
// Push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt 
// Push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt 
// Push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt 
// Push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt 
// Push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt 
// Push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt 
// Push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 53
@53
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
// Push constant 112
@112
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
// neg 
@0
A = M-1
M=-M
// and 
@0
AM=M-1
D=M
A=A-1
M=M&D
// Push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// or 
@0
AM=M-1
D=M
A=A-1
M=M|D
// not 
@0
A = M-1
M=!M
@_1
(_1)
0;JMP
