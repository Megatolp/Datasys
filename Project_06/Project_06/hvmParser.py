"""
hvmParser.py -- Parser class for Hack VM translator
"""

from hvmCommands import *

class Parser(object):
    def __init__(self, sourceName, comments=None):
        """
        Open 'sourceFile' and gets ready to parse it.
        """
        self.file = open(sourceName, 'r');
        self.lineNumber = 0
        self.line = ''
        self.rawline = ''
        self.comments = comments
        self.arg1 = None
        self.arg2 = None
        self.commandType = None

    def Advance(self):
        """
        Reads the next command from the input and makes it the current
        command.
        Returns True if a command was found, False at end of file.
        """
        while True:
            if self.file:
                self.rawline = self.file.readline()
                if len(self.rawline) == 0:
                    return False
                self.rawline = self.rawline.replace('\n', '')
                self.line = self.rawline
                i = self.line.find('//')                
                if i != -1:
                    if self.comments:
                        self.comments.Write('    '+self.line[i:])
                    self.line = self.line[:i]
                self.line = self.line.replace('\t', ' ').strip()
                if len(self.line) == 0:
                    continue
                self._Parse()
                return True
            else:
                return False

    def CommandType(self):
        #Probbly works
        firstword_dict = {
            T_PUSH:2,
            T_POP:3,
            T_LABEL:4,
            T_GOTO:5,
            T_IF : 6,
            T_FUNCTION : 7,
            T_RETURN : 8,
            T_CALL : 9
        }
        # ADDS all of the T_ARITHMETIC commands to the dict
        for t_command in T_ARITHMETIC:
            firstword_dict[t_command] = 1
        
        self.commandType = self.rawline.split()[0]
        self.commandType = firstword_dict[self.commandType]
        #print(self.commandType)


        """
        Returns the type of the current command:
            C_ARITHMETIC = 1
            C_PUSH = 2
            C_POP = 3
            C_LABEL = 4
            C_GOTO = 5
            C_IF = 6
            C_FUNCTION = 7
            C_RETURN = 8
            C_CALL = 9
        """
        return self.commandType
		
    def Arg1(self):
        """
        Returns the command's first argument.
        """
        if self.commandType in (C_POP, C_PUSH, C_FUNCTION, C_CALL, C_LABEL, C_IF, C_GOTO):
            self.arg1 = self.rawline.split()[1]
        elif self.commandType in (C_ARITHMETIC, C_CALL):
            self.arg1 = self.rawline.split()[0]
        else: 
            self.arg1 = "NOT IMPLEMENTED"


        return self.arg1

    def Arg2(self):
        """
        Returns the command's second argument.
        """
        if self.commandType in (C_POP, C_PUSH, C_FUNCTION, C_CALL):
            self.arg2 = self.rawline.split()[2] 
            #print(self.arg2)
        elif self.commandType == C_ARITHMETIC:
            if self.arg1 in (T_AND, T_ADD, T_SUB, T_EQ,T_GT,T_LT,T_AND,T_OR):
                self.arg2 == 0
        return self.arg2
 
    """
    The function to be implemented. 
	For Project 6 the function should parse PUSH/POP and the arithmetic commands.
	Parses the current comment. Assumes that there is a single whitespace between the command and between each argument (there can be up to 2 arguments). 
	Fills in 'commandType', 'arg1' and 'arg2'.
    Some examples:
---------------------------------------------------------------------
|        currentLine	-> desired contents							|
---------------------------------------------------------------------
| "push constant 2"		-> arg1="constant", arg2=2		|
| "call yourfunction 3" -> arg1="yourfunction", arg2=3	|
| "and"					-> arg1="and", arg2=0				|
| "label xyz"			-> arg1="xyz"							|
---------------------------------------------------------------------
    """

    def _Parse(self):
        # command [arg1 [arg2]]
        self.commandType = self.CommandType()  #this should store the type of the command
        self.arg1 = self.Arg1()         #this should store the first argument of the command (if there is a first argument)
        self.arg2 = self.Arg2()         #this should store the second argument of the command (if there is a second argument)

