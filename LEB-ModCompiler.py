from zipfile import ZipFile
import os
import shutil

def get_all_file_paths(directory):
  
    # initializing empty file paths list
    file_paths=[]
  
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
rmerror="Error was thrown, but it was most likely just a file/folder not existing"
#Delete directory
def del_item(rmitem):
    try:
        shutil.rmtree(rmitem)
    except (FileNotFoundError,NotADirectoryError):
        try:
            os.remove(rmitem)
        except FileNotFoundError:
            print(rmerror)

def compile_mod():
    ##Copy files to mod folder
    shutil.copytree(world_folder,"mod/world")

    # path to folder which needs to be compiled
    directory="mod"

    ##Remove unused data
    #Delete files and folders
    list=["advancements","DIM1","DIM-1","datapacks","dimensions","playerdata","scripts","stats","icon.png","level.dat","level.dat_old","session.lock"]
    for item in list:
        del_item("mod/world/"+item)

    ##Calling function to get all file paths in the directory
    file_paths=get_all_file_paths(directory)
  
    ##Printing the list of all files to be compiled
    print('Following files will be compiled:')
    for file_name in file_paths:
        print(file_name)
  
    ##Writing files to a zipfile
    with ZipFile(map_name+".lebmod",'w') as zip:
        ##Writing each file one by one
        for file in file_paths:
            zip.write(file)
    
    ##Remove temporary mod folder
    shutil.rmtree("mod")
  
    print('All files compiled successfully!')

##Asks for user input to establish parameters and write to metadata
meta_input=["","",""]
for i in range(3):
    inp=input("Enter "+"World Directory"*(i==0)+"Map Name"*(i==1)+"Description"*(i==2)+": ")
    print(("Set world directory to "+inp+"\n")*(i==0)+("Map name set to "+inp+"\n")*(i==1)+("Set description to \""+inp+"\"\n")*(i==2))
    meta_input[i]=inp
world_folder,map_name,map_desc=meta_input

##Find if small/large or just one type
multi_variant=None
while multi_variant not in ("y", "n", True, False):
    multi_variant=input("Does your map have a small and large variant or just one variant? y/n: ")
    if multi_variant=="y":
        multi_variant=True
        print("Set map to have multiple variants\n")
    elif multi_variant=="n":
        multi_variant=False
        has_small = False
        has_large = False
        print("Set map to have one variant\n")
    else:
        print("Invalid answer given\n")

if multi_variant:
    has_small=None
    while has_small not in ("y", "n", True, False):
        has_small=input("Does this map have a small variant? y/n: ")
        if has_small=="y":
            has_small=True
            print("Set map to small\n")
        elif has_small=="n":
            has_small=False
            print("Set map to not small\n")
        else:
            print("Invalid answer given\n")
    has_large=None
    while has_large not in ("y", "n", True, False):
        has_large=input("Does this map have a large variant? y/n: ")
        if has_large=="y":
            has_large=True
            print("Set map to large\n")
        elif has_large=="n":
            has_large=False
            print("Set map to not large\n")
        else:
            print("Invalid answer given\n")

print("Creating mod folder...")
try:
    os.mkdir('mod')
except OSError:
    print("Mod folder already exists!")

def write_meta():
    lebmeta=open("mod/lebmeta.txt","a")
    lebmeta.write("map_name = \""+str(map_name)+"\"")
    lebmeta.write("\nmap_desc = \""+str(map_desc)+"\"")
    lebmeta.write("\nmulti_variant = "+str(multi_variant))
    lebmeta.write("\nhas_small = "+str(has_small))
    lebmeta.write("\nhas_large = "+str(has_large))
    #lebmeta.write("\nhas_largeplus = "+str(has_largeplus))
    lebmeta.close

##Compile it
write_meta()
compile_mod()