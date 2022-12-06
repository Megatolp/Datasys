// Useage repcace @10, 11, 12, 13 with values 1-4
// Dont include in loop
@0
D=A
M=D


// Scheck2___et 1 to 10
@120 // val
D=A
@1 
M=D

// Set 2 to val
@5 //val
D=A
@2
M=D

// Set 3 to 12
@119 //val
D=A
@3
M=D

// Set 4 to 13
@120 // val
D=A
@4
M=D


// Sort in each set
// Change if 1>2
(swaps___)
    @1
    D=M
    @2
    D=D-M // D = @1>@2

    // Jump if 2>=1
    @change2___
    D;JLE

    //else swap values fo 1 and 2
    @1
    D=M
    //Temp = 1
    @5
    M=D

    //1 = 2
    @2
    D=M
    @1
    M=D

    // 2 = Temp
    @5
    D=M
    @2
    M=D
    @change2___
    0;JMP

    (change2___)
        @3
        D=M
        @4
        D=D-M // D = @1>@2

        // Jump if 2>=1
        @check___
        D;JLE

        //else swap values fo 1 and 2
        @3
        D=M
        //Temp = 1
        @5
        M=D

        //1 = 2
        @4
        D=M
        @3
        M=D

        // 2 = Temp
        @5
        D=M
        @4
        M=D
        @check___
        0;JMP





(check___)
    // Cases: 1[1]>2[1]:1 n1[1]<2[1]:2 eed to change names in python
    @1
    D=M
    @3
    // 1>3 D+
    D=D-M

    @check2___
    D;JGT


    // If 2>=4 add
    @2
    D=M
    @4
    D=D-M
    // Jump to add if true, else end
    @add___
    D;JGE
    @check2___
    0;JMP
(check2___)
    // Cases: 1[1]>2[1]:1 n1[1]<2[1]:2 eed to change names in python
    @3
    D=M
    @1
    // 1>3 D+
    D=D-M

    @end___
    D;JGT


    // If 2>=4 add
    @4
    D=M
    @2
    D=D-M
    // Jump to add if true, else end
    @add___
    D;JGE
    @end___
    0;JMP



// Add one to reg0
(add___)
    @0
    M=M+1

    @end___
    0;JMP


(end___)






