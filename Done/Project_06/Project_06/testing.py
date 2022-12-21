from hvmCommands import *

def CommandType(input:str):
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
    for t_command in T_ARITHMETIC:
        firstword_dict[t_command] = 1
    firstword = input
    print(firstword_dict)
    print(firstword_dict[firstword])

CommandType("sub")
CommandType("add")
CommandType("push")
CommandType("label")
CommandType("goto")
CommandType("if-goto")
CommandType("function")
CommandType("return")
CommandType("call")