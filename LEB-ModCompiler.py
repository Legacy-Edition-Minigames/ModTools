from zipfile import ZipFile
import os
import shutil

def get_all_file_paths(directory):
  
    # initializing empty file paths list
    file_paths = []
  
    # crawling through directory and subdirectories
    for root, directories, files in os.walk(directory):
        for filename in files:
            # join the two strings in order to form the full filepath.
            filepath = os.path.join(root, filename)
            file_paths.append(filepath)
  
    # returning all file paths
    return file_paths

##Remove unused data function
#Set error message
rmerror = "Error was thrown, but it was most likely just a file/folder not existing"
#Delete directory
def delunusedfold(rmdirectory):
    try:
        shutil.rmtree(rmdirectory)
    except NotADirectoryError:
        print(rmerror)
    except FileNotFoundError:
        print(rmerror)
#Delete file
def delunusedfile(rmfile):
    try:
        os.remove(rmfile)
    except NotADirectoryError:
        print(rmerror)
    except FileNotFoundError:
        print(rmerror)

def compilemod():
    ##Copy files to mod folder
    shutil.copytree(worldfolder, "mod/world")

    # path to folder which needs to be compiled
    directory = "mod"

    ##Remove unused data
    #Delete files and folders
    delunusedfold("mod/world/advancements")
    delunusedfold("mod/world/DIM1")
    delunusedfold("mod/world/DIM-1")
    delunusedfold("mod/world/datapacks")
    delunusedfold("mod/world/dimensions")
    delunusedfold("mod/world/playerdata")
    delunusedfold("mod/world/scripts")
    delunusedfold("mod/world/stats")
    delunusedfile("mod/world/icon.png")
    delunusedfile("mod/world/level.dat")
    delunusedfile("mod/world/level.dat_old")
    delunusedfile("mod/world/session.lock")

    ##Calling function to get all file paths in the directory
    file_paths = get_all_file_paths(directory)
  
    ##Printing the list of all files to be compiled
    print('Following files will be compiled:')
    for file_name in file_paths:
        print(file_name)
  
    ##Writing files to a zipfile
    with ZipFile(mapname + ".lebmod",'w') as zip:
        ##Writing each file one by one
        for file in file_paths:
            zip.write(file)
    
    ##Remove temporary mod folder
    shutil.rmtree(r"mod")
  
    print('All files compiled successfully!')

##Get world location
worldfolder = input("Enter World Directory: ")
print("Set world direcctory to " + worldfolder + "\n")

##Get map name
mapname = input("Enter Map Name: ")
print("Map name set to " + mapname + "\n")

##Get map description
mapdesc = input("Enter Description: ")
print("Set description to \"" + mapdesc + "\"\n")

##Find if small/large or just one type
has_large = None
while has_large not in ("y", "n", True, False):
    has_large = input("Does your map have a small and large variant or just one variant? y/n: ")
    if has_large == "y":
        has_large = True
        print("Set map to have multiple variants\n")
    elif has_large == "n":
        has_large = False
        print("Set map to have one variant\n")
    else:
        print("Invalid answer given\n")

if has_large:
    is_small = None
    while is_small not in ("y", "n", True, False):
        is_small = input("Is this map small? y/n: ")
        if is_small == "y":
            is_small = True
            print("Set map to small\n")
        elif is_small == "n":
            is_small = False
            print("Set map to not small\n")
        else:
            print("Invalid answer given\n")

print("Creating mod folder...")
try:
    os.mkdir('mod')
except OSError:
    print("Mod folder already exists!")

def writeMeta():
    ##Write metadata
    lebmeta = open("mod/lebmeta.txt","a")
    if has_large == True:
        lebmeta.write("has_large == True")
    else:
        lebmeta.write("has_large == False")
    lebmeta.close

##Compile it
writeMeta()
compilemod()