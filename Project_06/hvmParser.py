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
        """
        Returns the type of the current command:
        return self.commandType
		"""
        return self.commandType

    def Arg1(self):
        """
        Returns the command's first argument.
        """
        return self.arg1

    def Arg2(self):
        """
        Returns the command's second argument.
        """
        return self.arg2

    def _Parse(self):
        # command [arg1 [arg2]]

        # =============================================================
        parts = self.rawline.split()
        # Command type
        # Dictionary to translate word into command type
        commandtype_translator = {
            T_PUSH : C_PUSH,
            T_POP : C_POP,
            T_LABEL : C_LABEL,
            T_GOTO : C_GOTO,
            T_IF : C_IF,
            T_FUNCTION : C_FUNCTION,
            T_RETURN : C_RETURN,
            T_CALL : C_CALL
        }
        # Sets all arithmetic commands to 1
        for T_ARITHMETIC_COMMAND in T_ARITHMETIC:
            commandtype_translator[T_ARITHMETIC_COMMAND]= 1

        # Sets self.commandtype to corresponding integer
        T_COMMAND = parts[0]
        self.commandType = commandtype_translator[T_COMMAND]
        # =============================================================
        # Command 1
        # [add]  
        # arithmetic [add, sub, neg, etc.],
        if self.commandType == C_ARITHMETIC:
            self.arg1 = parts[0]
        
        # push [local] 0 | call [func] 3
        # Push, Pop, Function, Call, Label, If, If-goto
        else:
            self.arg1 = self.rawline.split()[1]
        # Cast to int
        # =============================================================
        # Command 2
        # Only these use two commands
        # push local [2], call fund [3]
        if self.commandType in (C_POP, C_PUSH, C_FUNCTION, C_CALL):
            self.arg2 = parts[2]
        elif self.commandType == C_ARITHMETIC: # For arithmetic commands
            self.arg2 = 0 
        else:
            self.arg2 = None
        # Cast to int
        self.arg2 = int(self.arg2)
        # =============================================================

