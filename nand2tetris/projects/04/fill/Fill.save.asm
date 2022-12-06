// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// 16384 offset
// 512 x 256 pix
// 8k words in memory
// Keyboard at 24576

// Screen pixel register

// Init
@SCREEN
D=A
@C_reg
M=D

(Loop)
@KBD
    D=M
// If keyboard Increase, else Decrease
    @Increase
        D;JGT

    @Decrease
        0;JMP


(Increase)
// Increase pixels
    //Check if reg is full


    //Read current register
    @C_reg
    D=M
    // Set at current
    A=D
    //Add another one to the reg (x*2+1)
    D=M
    M=D+M
    M=M+1
    //If reg is full
    D=M
    @Regfull
    D+1;JEQ
    
    @Loop
    0;JMP

    (Regfull)
    @C_reg
    M=M+1

    @Loop
    0;JMP

(Decrease)
// Decrease pixels
    @C_reg
    // Jump to regempty if reg is empty
    @Regempty
    M;JEQ 
    (Deccontinue)
    @C_reg
    M=0
    @Loop
    0;JMP


(Regempty)
    @C_reg
    M=M-1
    @Deccontinue
    0;JMP

(END)
    @END
    0;JMP
