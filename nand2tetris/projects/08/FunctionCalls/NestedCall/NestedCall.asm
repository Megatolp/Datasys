@256
D=A
@0
M=D

// Call Sys.init 0
@_1
D=M
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
// Function Sys.init 0
// Label Sys.init
(Sys.init)
// Push constant 4000
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop pointer 0
// Push constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop pointer 1
// Call Sys.main 0
@_2
D=M
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
@Sys.main
0;JMP

// Label _2
(_2)
// Pop temp 1
// Label LOOP
(LOOP)
// Goto LOOP
@LOOP
0;JMP
// Function Sys.main 5
// Label Sys.main
(Sys.main)
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
// Push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop pointer 0
// Push constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop pointer 1
// Push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop local 1
// Push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop local 2
// Push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop local 3
// Push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// Call Sys.add12 1
@_3
D=M
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
@6
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.add12
0;JMP

// Label _3
(_3)
// Pop temp 0
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
// Push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push local 4
@LCL
D=M
@4
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
// add 
@0
AM=M-1
D=M
A=A-1
M=M+D
// add 
@0
AM=M-1
D=M
A=A-1
M=M+D
// add 
@0
AM=M-1
D=M
A=A-1
M=M+D
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
// Function Sys.add12 0
// Label Sys.add12
(Sys.add12)
// Push constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop pointer 0
// Push constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop pointer 1
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
// Push constant 12
@12
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
@_4
(_4)
0;JMP
