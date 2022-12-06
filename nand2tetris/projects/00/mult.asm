// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// Test for r1 == 0
@2
M=0
@1
D=M
@30
D; JEQ
// Test for r2 == 0
@0
D=M
@30
D; JEQ


//Loop
@2
M=0 // Set r0 to 0

@0
D=M
@2
M=D+M // Add r0 to r2

@1
M=M-1 // Decrement r1
D=M
@12
D; JNE // If r1 !=0 jump back

