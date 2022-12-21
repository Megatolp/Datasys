//Usage
@i 
M=0
(loop)
// Increment i, save, and set RAM[i] to i
    @i
    M=M+1    
    D=M
    A=D
    M=D

// Save 10 to D
    @10
    D=M

// Open i, test 10-i, jump to end if true, else continue loop
    @i
    D=D-M
    @END
    D;JEQ
    @loop
    0;JMP


(END)
@END
0;JMP