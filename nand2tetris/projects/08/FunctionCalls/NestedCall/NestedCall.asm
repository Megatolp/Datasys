@256
D=A
@0
M=D

// Call Sys.init 0
@NestedCall$$ret._1
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

(NestedCall$$ret._1)
// Function Sys.init 0
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
// Push constant 5000
@5000
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
// Call Sys.main 0
@Sys.init$ret._2
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
@Sys.main
0;JMP

(Sys.init$ret._2)
// Pop temp 1
@6
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Label LOOP
(Sys.init$LOOP)
// Goto LOOP
@Sys.init$LOOP
0;JMP
// Function Sys.main 5
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
// Push constant 5001
@5001
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
// Push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop local 1
@LCL
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
// Push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop local 2
@LCL
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
// Push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop local 3
@LCL
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// Push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// Call Sys.add12 1
@Sys.main$ret._3
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

(Sys.main$ret._3)
// Pop temp 0
@5
D=A
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
//add
@SP
AM=M-1
D=M
A=A-1
M=M+D

//add
@SP
AM=M-1
D=M
A=A-1
M=M+D

//add
@SP
AM=M-1
D=M
A=A-1
M=M+D

//add
@SP
AM=M-1
D=M
A=A-1
M=M+D

// Return
@LCL
D=M
@R14
M=D
@5
D=A
@R14
A=M-D
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
D=M+1
@SP
M=D
@R14
A=M-1
D=M
@THAT
M=D
@2
D=A
@R14
A=M-D
D=M
@THIS
M=D
@3
D=A
@R14
A=M-D
D=M
@ARG
M=D
@4
D=A
@R14
A=M-D
D=M
@LCL
M=D
@R15
A=M
0;JMP
// Function Sys.add12 0
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
// Push constant 5002
@5002
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
//add
@SP
AM=M-1
D=M
A=A-1
M=M+D

// Return
@LCL
D=M
@R14
M=D
@5
D=A
@R14
A=M-D
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
D=M+1
@SP
M=D
@R14
A=M-1
D=M
@THAT
M=D
@2
D=A
@R14
A=M-D
D=M
@THIS
M=D
@3
D=A
@R14
A=M-D
D=M
@ARG
M=D
@4
D=A
@R14
A=M-D
D=M
@LCL
M=D
@R15
A=M
0;JMP
@_4
(_4)
0;JMP
