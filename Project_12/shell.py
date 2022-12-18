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
        if os.path.isfile(file) or os.path.isfile(cwd + "\\" + file):
            output = output + file + "\n"
        else:
            output = output + "DIR  " +  file + "\n"

    return output.strip()

def pwd(argstring):
    cwd = os.getcwd()
    return cwd


def man(arglist):
    command = arglist[0]
    outmsg = man_dict[command]
    return outmsg

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
    # To be able to read binary data too
    with open(filename,"rb") as readfile:
        for i in range(rows):
            output = output+ readfile.readline().decode()
    return output.strip()

def tail(arglist):
    filename = arglist[0]
    rows = 10
    
    output = ""
    if len(arglist)>1:
        rows = int(arglist[1])
    # To be able to read binary data too
    readlines = open(filename,"rb").readlines()[-rows:] 
    for line in readlines:
        output = output + line.decode()

    return output.strip()
    
def touch(arglist):
    filename = arglist[0]
    open(filename,"x")
    return

def rm(arglist):
    filename = arglist[0]
    os.remove(filename)
    pass

def cp(arglist):
    filesrc, filedst = arglist[0:2]
    filebuffer = open(filesrc,"rb").read()
    open(filedst,"x")
    open(filedst,"wb").write(filebuffer)
    return

def mv(arglist):
    cp(arglist)
    filedst = arglist[1]
    rm(arglist)
    return
def help(arglist):
    output = ""
    for key in man_dict.keys():
        output = output + key + "\n"
    return output.strip()

def donot(argstring):
    print("\n")




command_list = {
    "echo":echo,
    "pwd":pwd,
    "ls": ls,
    "cd":cd,
    "man":man,
    "head":head,
    "tail":tail,
    "cat":cat,
    "touch":touch,
    "rm":rm,
    "cp":cp,
    "mv":mv,
    "help":help,
    "not":donot
}

man_dict = {
    "echo":"prints out the user input",
    "pwd":"prints current directory",
    "ls":"lists contents of current directory",
    "cd":"change current directory",
    "man":"prints manual for command",
    "head":"prints first lines of a file",
    "cat":"prints contents of file",
    "touch":"creates an empty file",
    "rm":"prints current directory",
    "cp":"prints current directory",
    "mv":"prints current directory",
    "not":"prints current directory",
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
            if output != "" and output != None:
                print(output)
        except Exception as E:
            print(E.args[-1])
    else:
        print("Command not found: ", user_in)
        pass
