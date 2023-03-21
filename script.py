
with open("elements.txt") as my_file:
    lines = my_file.readlines()
    for line in lines:
        line = ''.join([i for i in line if not i.isdigit()])
        # if line[-2]!="]":
        line=line[0:-1]
        line = line + ","
        print(line)
        