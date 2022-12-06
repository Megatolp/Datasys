// Multiply two numbers
// Usage: multiplies values in 
//  RAM[0] and RAM[1] to RAM[2]


// Reset RAM[2]
    @R2
    M=0
//Check 0 for 0
    @R0
    D=M
    
// Set RAM[3] to RAM[0] For later
    @R3
    M=D
// Jump to end if 0
    @END
    D;JEQ

//Check 1 for 0
    @R1
    D=M
// Jump to end if 0
    @END
    D;JEQ

//Test which is larger

    @R1
    D=M
    @R3
// RAM[3] = R0-R1
    M=M-D
    D=M
// Do jump if 0 is larger than one
    @R0larger
    D;JGT
// R1 is larger than R0:
(R1larger)
    @R1
    D=M
    @R2
    M=M+D

    @R0
    D=M
    M=M-1
    D=M
//Jump if R0 > 0
    @R1larger
    D;JGT
    @END
    D;JMP

// R0 is larger than R1
(R0larger)
    @R0
    D=M
    @R2
    M=M+D

    @R1
    D=M
    M=M-1
    D=M
//Jump if R1 > 0
    @R0larger
    D;JGT

(END)
    @END
    D;JMP
















