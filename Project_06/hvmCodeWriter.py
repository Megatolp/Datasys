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
        # If push command
        if commandType == C_PUSH: # If push command
            self.Write(f"// Push {segment} {index}")
            code = ''
            #print(segment)
            if segment in SEGMENT_MAP.keys(): # Arg, Lcl, This, That
                seg = SEGMENT_MAP[segment]
                code = f'@{seg},D=M,@{index},A=D+A,D=M,@SP,A=M,M=D,@SP,M=M+1' 
            elif segment == T_CONSTANT:
                code = f'@{index},D=A,@SP,A=M,M=D,@SP,M=M+1' 
            elif segment == T_STATIC:
                code = f'@{self.fileName}.{index},D=M,@SP,A=M,M=D,@SP,M=M+1' 
            elif segment in (T_TEMP):
                code = f'@{5 + index},A=M,D=M,@SP,A=M,M=D,@SP,M=M+1' 
            elif segment in (T_POINTER):
                code = f'@THIS,D=A,@{index},A=D+A,D=M,@SP,A=M,M=D,@SP,M=M+1' 

            self._WriteCode(code)
            

        elif commandType == C_POP: # If pop command
            self.Write(f"// Pop {segment} {index}")
            code = ''
            if segment in SEGMENT_MAP.keys(): # Arg, Lcl, This, That
                seg = SEGMENT_MAP[segment]
                #print(seg)
                code = f'@{seg},D=M,@{index},D=D+A, @R13, M=D, @SP, AM=M-1, D=M, @R13, A=M, M=D'
            elif segment == T_STATIC:
                code = f'@{self.fileName}.{index}, D=A , @R13, M=D, @SP, AM=M-1, D=M, @R13, A=M, M=D'
            elif segment in (T_TEMP):
                code =f'@5, D=A, @{index}, A=D+A, D=M, @R13, M=D, @SP, AM=M-1, D=M, @R13, A=M, M=D' 
            elif segment in (T_POINTER):
                code = f'@THIS, D=A, @{index}, D=D+A, @R13, M=D, @SP, AM=M-1, D=M, @R13, A=M, M=D'
        else:
            print("NOPUSHPOP")



            self._WriteCode(code)
            
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
        # command of type "add", "not"
        operator_table = {
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
        single_operand = ("neg", "not")
        simple_math = ("add","sub","and","or")
        conditional = ("JEQ","JGT","JLT")

        # operand = +, -, 
        operand = operator_table[command]
        lines = ""
        code_lines = [
            f"// {command} ", # Comment what it is writing
        ]
        if command in single_operand:
            lines = [
            "@0",
            "A = M-1",
            f"M={operand}M"
            ]
        elif command in simple_math:
            lines = [
            "@0",
            "AM=M-1",
            "D=M",
            "A=A-1",
            f"M=M{operand}D",
            ]
        elif command in conditional:
            lbl = self._UniqueLabel()
            lines = [
            "@0",
            "AM=M-1",
            "D=M",
            "A=A-1",
            "D=M-D",
            "M=-1",
            f"@label{lbl}",
            f"D;{operand}",
            "@0",
            "A=M-1",
            "M=0",
            f"(label{lbl})"
            ]
        
        for line in lines:
            code_lines.append(line)

        for line in code_lines:
            self.Write(line)

        
    def WriteInit(self, sysinit = True):
        """
        Write the VM initialization code:
	To be implemented as part of Project 7
        """
        if (debug):
            self.file.write('    // Initialization code\n')
        if sysinit:
            code = ""
            code += "@256, D=A, @0, M=D, "
            self._WriteCode(code)
            self.WriteCall("Sys.init", 0)

    def WriteLabel(self, label):
        code_lines = [
            f"// Label {label}", # Comment what to do
            f"({label})"
        ]
        for line in code_lines:
            self.Write(line)

    def WriteGoto(self, label):
        code_lines = [
            f"// Goto {label}", # Comment what to do
            f"@{label}",
            "0;JMP"
        ]
        for line in code_lines:
            self.Write(line)

        """
        Write Hack code for 'goto' VM command.
	To be implemented as part of Project 7
        """

    def WriteIf(self, label):
        code_lines = [
            f"// If-goto {label}",
            "@SP",
            "AM=M-1",
            "D=M",
            f"@{label}",
            "D;JGT" # JNE? säger annorlunda #
        ]
        for line in code_lines:
            self.Write(line)
        """
        Write Hack code for 'if-goto' VM command.
	To be implemented as part of Project 7
        """
        

    def WriteFunction(self, functionName, numLocals):
        """
        Write Hack code for 'function' VM command.
	To be implemented as part of Project 7
        """
        self.Write(f"// Function {functionName} {numLocals}")
        self.WriteLabel(functionName)
        for i in range(int(numLocals)):
            self.WritePushPop(C_PUSH, T_CONSTANT, 0)


    def WriteReturn(self):
        """
        Write Hack code for 'return' VM command.
	To be implemented as part of Project 7
        """
        def pop_seg(seg, offset):
            return f"@R14, D=M, @{offset}, A=D-A, D=M, @{seg}, M=D, "

        
        # endFrame = R14
        # retAddr = R15
        self.Write("// Return")
        
        code = ""
        # endFrame [R14]= LCL
        code += "@LCL, D=M, @R14, M=D, "

        # retAddr [R15]= *( endframe - 5)
        code += "@R14, D=M, @5, A=D-A, D=M, @R15, M=D, "

        # *ARG = pop()
        code += "@SP, AM=M-1, D=M, @ARG, A=M, M=D, "

        # SP = ARG + 1
        code += "@ARG, D=M, @SP, M=D+1, "

        # THAT = *(endFrame - 1)
        code += pop_seg("THAT", 1)

        # THIS = *(endFrame - 2)
        code += pop_seg("THIS", 2)

        # ARG = *(endFrame - 3)
        code += pop_seg("ARG", 3)

        # LCL = *(endFrame - 4)
        code += pop_seg("LCL", 4)


        # GoTo *R15
        code += "@R15, A=M, 0;JMP"

        self._WriteCode(code)
        

    def WriteCall(self, functionName, numArgs):
        """
        Write Hack code for 'call' VM command.
	To be implemented as part of Project 7
        """
        def push_seg(seg):
            return f"@{seg},D=M,@SP,A=M,M=D,@0,M=M+1, "
            

        ret_addr = self._UniqueLabel()


        self.Write(f"// Call {functionName} {numArgs}")
        code = ""
        # Push ret address
        code += push_seg(ret_addr)
            #code += f"@{ret_addr},D=A,@SP,A=M,M=D,@0,M=M+1" IF ERRORS later

        # Push LCL
        code += push_seg("LCL")

        # Push ARG
        code += push_seg("ARG")

        # Push THIS
        code += push_seg("THIS")

        # Push THAT
        code += push_seg("THAT")

        # ARG = SP - 5 - numArgs
        code += f"@{numArgs + 5}, D=A, @SP, D=M-D, @ARG, M=D, "

        # LCL = SP
        code += "@SP, D=M, @LCL, M=D, "

        # Goto Functionname
        code += f"@{functionName}, 0;JMP, " 

        # Write code
        self._WriteCode(code)
        
        # (Ret addr)
        self.WriteLabel(ret_addr)
    

    
