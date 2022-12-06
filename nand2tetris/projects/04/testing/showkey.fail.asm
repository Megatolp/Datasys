// Keyboard at 24576

// Screen pixel register
@16384 
D=A
@0
M=D

// Read Keyboard
@24576
D = M 
// If input jump to (Has input)
@10
D; JGT
// No input:


@25
M;JMP
// Has input
@0
D=M
// Current pixel register
A=D
D=M
M = D+M
M = M+1
// If reg == 1111111 | -1 #Handled by decrement
D=M
@21
D+1;JEQ

@25
M;JMP

//Increment register count
@0
M=M+1

@25
M;JMP
//Return loop
@4
M;JMP 
