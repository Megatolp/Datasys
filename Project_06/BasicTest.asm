// Push constant 10
@10
D=M
@SP
A=M
M=D
@SP
M=M+1
// Pop ('local', 0)
// Push constant 21
@21
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push constant 22
@22
D=M
@SP
A=M
M=D
@SP
M=M+1
// Pop ('argument', 2)
// Pop ('argument', 1)
// Push constant 36
@36
D=M
@SP
A=M
M=D
@SP
M=M+1
// Pop ('this', 6)
// Push constant 42
@42
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push constant 45
@45
D=M
@SP
A=M
M=D
@SP
M=M+1
// Pop ('that', 5)
// Pop ('that', 2)
// Push constant 510
@510
D=M
@SP
A=M
M=D
@SP
M=M+1
// Pop ('temp', 6)
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
// sub 
// Push temp 6

// add 
@_1
(_1)
0;JMP
