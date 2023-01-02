"""
hvmCodeWriter.py -- Code Writer class for Hack VM translator
"""

import os
from hvmCommands import *

debug = False

class CodeWriter(object):
    
    def __init__(self, outputName):
        """
        Open 'outputName' and gets ready to write it.
        """
        self.file = open(outputName, 'w')
        self.SetFileName(outputName)

        self.labelNumber = 0
        self.returnLabel = None
        self.callLabel = None
        self.cmpLabels = {}
        self.needHalt = True


    def Debug(self, value):
        """
        Set debug mode.
        Debug mode writes useful comments in the output stream.
        """
        global debug
        debug = value


    def Close(self):
        """
        Write a jmp $ and close the output file.
        """
        if self.needHalt:
            if debug:
                self.file.write('    // <halt>\n')
            label = self._UniqueLabel()
            self._WriteCode('@%s, (%s), 0;JMP' % (label, label))
        self.file.close()


    def SetFileName(self, fileName):
        """
        Sets the current file name to 'fileName'.
        Restarts the local label counter.

        Strips the path and extension.  The resulting name must be a
        legal Hack Assembler identifier.
        """
        if (debug):
            self.file.write('    // File: %s\n' % (fileName))
        self.fileName = os.path.basename(fileName)
        self.fileName = os.path.splitext(self.fileName)[0]
        self.functionName = None


    def Write(self, line):
        """
        Raw write for debug comments.
        """
        self.file.write(line + '\n')

    def _UniqueLabel(self):
        """
        Make a globally unique label.
        The label will be _sn where sn is an incrementing number.
        """
        self.labelNumber += 1
        return '_' + str(self.labelNumber)


    def _LocalLabel(self, name):
        """
        Make a function/module unique name for the label.
        If no function has been entered, the name will be
        FileName$$name. Otherwise it will be FunctionName$name.
        """
        if self.functionName != None:
            return self.functionName + '$' + name
        else:
            return self.fileName + '$$' + name


    def _StaticLabel(self, index):
        """
        Make a name for static variable 'index'.
        The name will be FileName.index
        """
        return self.fileName + '.' + str(index)    


    def _WriteCode(self, code):
        """
        Write the comma separated commands in 'code'.
        """
        code = code.replace(',', '\n').replace(' ', '')
        self.file.write(code + '\n')
        

 
        

    """"
    The functions to be implemented are found beyond this point 
    """
	
    """
    Parameters: 

    Result: 
    For push: Pushes the content of segment[index] onto the stack. It is a good idea to move the value to be pushed into a register first, then push the content of the register to the stack.
    For pop: Pops the top of the stack into segment[index]. You may need to use a general purpose register (R13-R15) to store some temporary results.
    Returns: 
    Nothing.
    Hint: Recall that there are 8 memory segments in the VM model, but only 5 of these exist in the assembly definition. Also, not all 8 VM segments allow to perform both pop and push on them. Chapter 7.3 of the book explains memory segment mapping.
    Hint: Use pen and paper first. Figure out how to compute the address of segment[index] (except for constant). Then figure out how you move the value of segment[index] into a register (by preference D). Then figure out how to push a value from a register onto the stack. 
    Hint: For pop, you already know how to compute the address of segment[index]. Store it in a temporary register (you can use R13 to R15 freely). Then read the value from the top of the stack, adjust the top of the stack, and then store the value at the location stored in the temporary register.
    """


    def WritePushPop(self, commandType, segment, index):
        lines = []
        if commandType == C_PUSH:
            if segment == T_CONSTANT:
                lines = [
                    f"@{index}",
                    "D=A",
                    #Opens RAM att sp
                    "@0",
                    "A=M",
                    "M=D",
                    "@0",
                    "M=M+1"
                ]
            elif segment == "temp" or segment == "pointer" or segment.split("_")[0]=="@":
                lines = [
                    f"@{SEGMENT_MAP[segment] + int(index)}",
                    "D=M",
                    #Opens RAM att sp
                    "@0",
                    "A=M",
                    "M=D",
                    "@0",
                    "M=M+1"
                ]
            elif segment == "this" or segment == "that" or segment == "local":
                lines = [
                    f"@{SEGMENT_MAP[segment]}",
                    "D=M",
                    f"@{index}",
                    "D=D+A", #DONT WORK
                    "A=D",
                    "D=M",
                    #Opens RAM att sp
                    "@0",
                    "A=M",
                    "M=D",
                    "@0",
                    "M=M+1"
                ]
            else:
                # Open value at segment map, add {index} to value, then push to stack
                lines = [
                    # Opens segment
                    f"@{SEGMENT_MAP[segment]}",
                    "D=M",
                    # Adds index
                    f"@{int(index)}",
                    "A=D+A",
                    "D=M",
                    #Opens RAM att sp
                    "@0",
                    "A=M",
                    "M=D",
                    "@0",
                    "M=M+1"
                ]
        elif commandType == C_POP:
            if segment == "temp" or segment == "tempregs" or segment.split("_")[0] == "@":
                segment = segment.split("_")[-1]
                lines = [
                    # Gets first value before sp and saves to D
                    "@0",
                    "AM=M-1",
                    "D=M",
                    # Opens at temp-start + index
                    f"@{SEGMENT_MAP[segment]+int(index)}",
                    "M=D"
                ]
            elif segment == "pointer":
                lines = [
                    # Opens at segment, adds index and saves address to R13
                    f"@{SEGMENT_MAP[segment]}",
                    "D=A",
                    # Adds index
                    f"@{int(index)}",
                    "D=D+A",
                    "@R13",  
                    "M=D",

                    # Gets first value before sp and saves to adress stored in R13
                    "@0",
                    "AM=M-1",
                    "D=M",
                    "@R13",
                    "A=M",
                    "M=D"
                ]


            else:
                lines = [
                    # Opens at segment, adds index and saves address to R13
                    f"@{SEGMENT_MAP[segment]}",
                    "D=M",
                    # Adds index
                    f"@{int(index)}",
                    "D=D+A",
                    "@R13",  
                    "M=D",

                    # Gets first value before sp and saves to adress stored in R13
                    "@0",
                    "AM=M-1",
                    "D=M",
                    "@R13",
                    "A=M",
                    "M=D"
                ]


        for line in lines:
            self.file.write(line+"\n")
        """
        Write Hack code for 'commandType' (C_PUSH or C_POP).
        'segment' (string) is the segment name.
        'index' (int) is the offset in the segment.
	To be implemented as part of Project 6
	
	    For push: Pushes the content of segment[index] onto the stack. It is a good idea to move the value to be pushed into a register first, then push the content of the register to the stack.
        For pop: Pops the top of the stack into segment[index]. You may need to use a general purpose register (R13-R15) to store some temporary results.
        Hint: Recall that there are 8 memory segments in the VM model, but only 5 of these exist in the assembly definition. Also, not all 8 VM segments allow to perform both pop and push on them. Chapter 7.3 of the book explains memory segment mapping.
        Hint: Use pen and paper first. Figure out how to compute the address of segment[index] (except for constant). Then figure out how you move the value of segment[index] into a register (by preference D). Then figure out how to push a value from a register onto the stack. 
        Hint: For pop, you already know how to compute the address of segment[index]. Store it in a temporary register (you can use R13 to R15 freely). Then read the value from the top of the stack, adjust the top of the stack, and then store the value at the location stored in the temporary register.

        """
        
    def WriteArithmetic(self, command):
        arithmeticString = []
        operand = ""
        arithmetic_table = {
            #One operand
            "neg":"-",
            "not":"!",

            #Simple math    
            "add":"+",
            "sub":"-",
            "and":"&",
            "or":"|",

            #Conditional
            "eq":"JEQ",
            "gt":"JGT",
            "lt":"JLT"

        }
        operand = arithmetic_table[command]
        # Neg, Not
        single_operand = [
        "@0",
        "A = M-1",
        f"M={operand}M"
        ]

        # Add, sub, and ,or
        simplemath = [
        "@0",
        "AM=M-1",
        "D=M",
        "A=A-1",
        f"M=M{operand}D",
        ]

        #eq, gt, lt
        #Check if true, then jump to label, else set to false
        conditional = [
        "@0",
        "AM=M-1",
        "D=M",
        "A=A-1",
        "D=M-D",
        "M=-1",
        f"@label{self.labelNumber}",
        f"D;{operand}",
        "@0",
        "A=M-1",
        "M=0",
        f"(label{self.labelNumber})"
        ]
        if command in (T_NEG,T_NOT):
            arithmeticString = single_operand
        if command in (T_ADD,T_SUB,T_AND,T_OR):
            arithmeticString = simplemath
        elif command in (T_EQ, T_GT, T_LT):
            self.labelNumber += 1
            arithmeticString = conditional
        for line in arithmeticString:
            self.file.write(line + "\n")
            

            


        """
        Write Hack code for stack arithmetic 'command' (str).
	To be implemented as part of Project 6
	    
		Compiles the arithmetic VM command into the corresponding ASM code. Recall that the operands (one or two, depending on the command) are on the stack and the result of the operation should be placed on the stack.
        The unary and the logical and arithmetic binary operators are simple to compile. 
         The three comparison operators (EQ, LT and GT) do not exist in the assembly language. The corresponding assembly commands are the conditional jumps JEQ, JLT and JGT. You need to implement the VM operations using these conditional jumps. You need two labels, one for the true condition and one for the false condition and you have to put the correct result on the stack.
        """
        
    def WriteInit(self, sysinit = False):
        """
        Write the VM initialization code:
	To be implemented as part of Project 7
        """
        if (debug):
            self.file.write('    // Initialization code\n')
        lines = [
            "@256",
            "D=A",
            "@0",
            "M=D"
        ]
        for line in lines:
            self.file.write(line + "\n")
        self.WriteCall("Sys.init", 0)


    def WriteLabel(self, label):
        lines = [
            f"({label})"
        ]
        for line in lines:
            self.file.write(line + "\n")
        """
        Write Hack code for 'label' VM command.
	To be implemented as part of Project 7

        """

    def WriteGoto(self, label):
        lines = [
#            f"@{SEGMENT_MAP['stack-pointer']}",
#            "AM=M-1",
#            "D=M",
            f"@{label}",
            "D;JMP"
        ]
        for line in lines:
            self.file.write(line + "\n")
        """
        Write Hack code for 'goto' VM command.
	To be implemented as part of Project 7
        """

    def WriteIf(self, label):
        # If at sp is 0 jump
        lines = [
        f"@{SEGMENT_MAP['stack-pointer']}", # Pop from sp
        "AM=M-1",
        "D=M", # Set D to val in arg 0
        f"@{label}", # Open label
        "D;JGT" # Jump if D>0
        ]
        for line in lines:
            self.file.write(line + "\n")
        """
        Write Hack code for 'if-goto' VM command.
	To be implemented as part of Project 7
        """
        

    def WriteFunction(self, functionName, numLocals):
        lines = []
        
        
        # Sets up local segment of function and init to 0
        # Push nVars* 0
        # Set lcl to start of nVars
        # Push a return value to the stack
        self.WriteLabel(functionName)
        print(numLocals)
        for i in range(len(numLocals)):
            self.WritePushPop(C_PUSH,"constant",i)

         
        
        
        
        """
        Write Hack code for 'function' VM command.
	To be implemented as part of Project 7
        """


    def WriteReturn(self):
        # Push a value onto stack and reinstate state of stack as before

        # Take topmost value of stack (return value)
        # Copy onto arg0
        # Restore segment pointers of caller
        # Clear the stack
        # Set SP for caller
        # Jump to ret address within caller code


        self.WritePushPop(C_POP,"argument",0) # Pop ret val into arg0

        # Set Address of arg1 to address of Arg 1
        lines = [
            "@2",
            "D=M",
            "@1",
            "D=D+A",
            "@0",
            "M=D"
        ]
        for line in lines:
            self.file.write(line + "\n")

        # Set endFrame in R13 as Local
        self.WritePushPop(C_PUSH,"@_local",0)
        self.WritePushPop(C_POP,"tempregs",0) # Frame to R13

        lines = [
            "@5",
            "D=A",
            "@13", # Endframe in 13
            "D=M-D", # Frame - 5
            "@14", # Ret addr in R14
            "M=D",
            #Restore that
            "@13",
            "D=M",
            "@1",
            "D=D-A",
            "A=D",
            "D=M",
            "@4",
            "M=D",
            #Restore this
            "@13",
            "D=M",
            "@2",
            "D=D-A",
            "A=D",
            "D=M",
            "@3",
            "M=D",
            # Restore arg
            "@13",
            "D=M",
            "@3",
            "D=D-A",
            "A=D",
            "D=M",
            "@2",
            "M=D",
            # Restore lcl
            "@13",
            "D=M",
            "@4",
            "D=D-A",
            "A=D",
            "D=M",
            "@1",
            "M=D",
        ]
        for line in lines:
            self.file.write(line + "\n")
        self.WritePushPop(C_PUSH,"tempregs",1) # Push ret val
        self.WritePushPop(C_POP,"argument",0) # Pop into arg
        

        



        """
        Write Hack code for 'return' VM command.
	To be implemented as part of Project 7
        """

    def WriteCall(self, functionName, numArgs):
        # Pass parameters to the called function
        # Determine return address
        # Save callers ret address, stack and memory segment
        # Jump to function
        
        # Call foo nArgs

        #1. Arg = sp - nArgs
        #2. Saves the calles frame (saved)
            #Ret addr
            #LCL
            #ARG
            #THIS
            #THAT
        #4. Jump to execute foo
        temp_label =  self._UniqueLabel()
        # Push Ret addres
        push_ret_addr = [
            f"@{temp_label}",
            "D=A",
            "@R13",
            "M=D"
        ]
        for line in push_ret_addr:
            self.file.write(line + "\n")
        self.WritePushPop(C_PUSH,"tempregs",0)

        # Push LCL,ARG,THIS,THAT
        self.WritePushPop(C_PUSH,"local",0)
        self.WritePushPop(C_PUSH,"argument",0)
        self.WritePushPop(C_PUSH,"this",0)
        self.WritePushPop(C_PUSH,"that",0)

        # Arg = SP - 5 - nArgs
        setarg = [
            "@0",
            "D=M",
            f"@{5 + int(numArgs)}", # SP - nargs -5
            "D=D-A",
            "@R13",
            "M=D"
        ]
        for line in setarg:
            self.file.write(line + "\n")

        self.WritePushPop(C_PUSH,"tempregs",0) # Push new ARG
        self.WritePushPop(C_POP,"@_argument",0) # Pop new arg
        self.WritePushPop(C_PUSH,"stack-pointer",0) # Push new Local
        self.WritePushPop(C_POP,"@_local",0) # pop new local
        
        
        #Write Goto function and declare return address
        self.WriteGoto(functionName)
        self.WriteLabel(temp_label)


        """
        Write Hack code for 'call' VM command.
	To be implemented as part of Project 7
        """

    

