import os

running = True

def argparse(argstring):
    arglist = argstring.split()
    return arglist

def echo(argstring):
    return argstring

def cd(arglist):
    if len(arglist)>1:
        print("Too many arguments")
        return
    cwd = os.getcwd()
    #print(cwd)
    os.chdir(arglist[0])
    cwd = os.getcwd()
    return cwd

def ls(argstring):
    cwd = os.getcwd()
    ls_out = os.listdir(cwd)
    output = ""
    for file in ls_out:
        output = output + file + "\n"
    return output.strip()

def pwd(argstring):
    cwd = os.getcwd()
    return cwd


def man(argstring):
    pass

def cat(arglist):
    if len(arglist) > 1:
        print("Too many arguments")
        return
    filename = arglist[0]
    readfile = open(filename,"r").read()
    return readfile

def head(arglist):
    if len(arglist) == 0:
        print("Too few args")
        return
    if len(arglist) > 2:
        print("Too many args")
        return
    filename = arglist[0]
    rows = 10
    
    output = ""
    if len(arglist)>1:
        rows = int(arglist[1])
    with open(filename,"r") as readfile:
        for i in range(rows):
            output.appen(readfile.readline())
    return output

def touch(arglist):
    filename = arglist[0]
    open(filename,"x")
    return

def rm(argstring):
    pass

def cp(argstring):
    pass
def mv(argstring):
    pass


def donot(argstring):
    print("\n")




command_list = {
    "echo":echo,
    "pwd":pwd,
    "ls": ls,
    "cd":cd,
    "man":man,
    "head":head,
    "cat":cat,
    "touch":touch,
    "not":donot
}

print("Welcome to my shell")

while running:
    user_in = input("$ ")
    if user_in.strip() == "":
        continue


    user_command = user_in.split()[0]
    # Get args as a string from $     echo"^             $"
    user_argstring = user_in[user_in.find(user_command) + len(user_command):].strip()
    
    #print("HELP:\n",user_in,"\n",user_command,"\n",user_argstring)
    if user_command in command_list.keys():
        try:
            output = ""
            if user_command == "echo":
                output = command_list[user_command](user_argstring)
            else:
                output = command_list[user_command](argparse(user_argstring))
            if output != "":
                print(output)
        except Exception as E:
            print(E.args[-1])
    else:
        print("Command not found: ", user_in)
        pass
