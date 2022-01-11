try:
    nextround = open("world/datapacks/4jbattle/data/4jbattle/functions/game/nextround.mcfunction", "r")
#    nextroundfile = (nextround.read())
    nextroundarray = ["dummy"]
    for line in nextround:
        if "4j.map" in line:
            nextroundarray[-1] = line
        if line == "##Modded Maps":
            
#        print(line)
    for str in nextroundarray:
        print(str)
#    for line in nextround:
#        if "4j.map" in line:
#            print(line)
    nextround.close()
except FileNotFoundError:
    print("Could not find LEB datapack, is the world directory correct?")


#https://www.geeksforgeeks.org/working-zip-files-python/