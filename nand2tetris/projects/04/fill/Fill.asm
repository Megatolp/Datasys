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

//Screen 16384 offset
//ScreenMax 24576
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
// Test if at bottom, in that case go back to loop
    @C_reg
    D=M
    @KBD
    D=D-A
    @Loop
    D;JEQ
    //Read current register
    @C_reg
    D=M
    // Set at current and set to balck
    A=D
    M=-1

    //Increment reg counter
    @C_reg
    M=M+1

    @Loop
    0;JMP


(Decrease)
// Test if at bottom, in that case go back to loop
    @C_reg
    D=M
    @SCREEN
    D=D-A
    @Loop
    D;JEQ
// Decrease pixels
    @C_reg
    M=M-1
    A=M
// Set reg to 0    
    M=0


    @Loop
    0;JMP



(END)
    @END
    0;JMP
