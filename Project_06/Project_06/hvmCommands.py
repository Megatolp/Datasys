"""
hvmCommands.py -- CommandType values for Hack VM translator
"""

C_ARITHMETIC = 1
C_PUSH = 2
C_POP = 3
C_LABEL = 4
C_GOTO = 5
C_IF = 6
C_FUNCTION = 7
C_RETURN = 8
C_CALL = 9


T_ADD = 'add'
T_SUB = 'sub'
T_AND = 'and'
T_OR = 'or'

T_EQ = 'eq'
T_GT = 'gt'
T_LT = 'lt'

T_NEG = 'neg'
T_NOT = 'not'

T_PUSH = 'push'
T_POP = 'pop'

T_LABEL = 'label'

T_GOTO = 'goto'
T_IF = 'if-goto'
T_FUNCTION = 'function'
T_RETURN = 'return'
T_CALL = 'call'

T_ARITHMETIC = (T_ADD, T_SUB, T_NEG, T_EQ, T_GT, T_LT, T_AND, T_OR, T_NOT)

T_PUSH_OR_POP = (T_PUSH, T_POP)



S_ARGUMENT = 1
S_LOCAL = 2
S_STATIC = 3
S_CONSTANT = 4
S_THIS = 5
S_THAT = 6
S_POINTER = 7
S_TEMP = 8

T_ARGUMENT = 'argument'
T_LOCAL = 'local'
T_STATIC = 'static'
T_CONSTANT = 'constant'
T_THIS = 'this'
T_THAT = 'that'
T_POINTER = 'pointer'
T_TEMP = 'temp'

#Might need to pdate
#TODO
SEGMENT_MAP = {
    "local":300,
    "argument":400,
    "temp":5,
    "this":3000,
    "that":3010

}
'''
@256
D=A
@0
M=D
'''

