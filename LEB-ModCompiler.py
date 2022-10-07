import json
import os
import shutil
from zipfile import ZIP_BZIP2, ZipFile

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
#Delete directory
def del_item(rmitem):
    #Set error message
    rmerror=rmitem+" cannot be found! Skipping.."
    try:
        shutil.rmtree(rmitem)
    except (FileNotFoundError,NotADirectoryError):
        try:
            os.remove(rmitem)
        except FileNotFoundError:
            print(rmerror)

def load_mod_config():
    ##Load mod config
    global modconfig
    with open('src/lebmod.json', 'r') as modconfigfile:
        modconfig = json.load(modconfigfile)
    #Create spaceless mod name variable
    global modnameSpaceless
    modnameSpaceless = str(modconfig['name']).replace(' ', '-')
    #Create mod ID variable
    global modID
    modID = str(modconfig['id'])
    print("Loaded config for mod "+str(modconfig['name']))

def rm_unused(directory):
    ##Remove unused data
    #Delete files and folders
    list=["advancements","DIM1","DIM-1","datapacks","dimensions","playerdata","scripts","stats","icon.png","level.dat","level.dat_old","session.lock"]
    for item in list:
        del_item(directory+"/"+item)

def compile_mod():
    ##path to folder which needs to be compiled
    directory="4j.modtools-temp"

    ##Copy files to temp folder
    shutil.copytree("src",directory)

    ##Rename lebmod.json to config.json
    os.rename(directory+"/lebmod.json",directory+"/config.json")

    ##Remove unused data
    if modconfig['hassmall']:
        print("Cleaning up unused files for Small map type")
        rm_unused(directory+"/world/small")
    if modconfig['haslarge']:
        print("Cleaning up unused files for Large map type")
        rm_unused(directory+"/world/large")
    if modconfig['haslargeplus']:
        print("Cleaning up unused files for Large+ map type")
        rm_unused(directory+"/world/largeplus")
    if modconfig['hasremastered']:
        print("Cleaning up unused files for Remastered map type")
        rm_unused(directory+"/world/remastered")

    ##Change directory to temp folder
    os.chdir(directory)

    ##Calling function to get all file paths in the directory
    file_paths=get_all_file_paths('./')
  
    ##Printing the list of all files to be compiled
    print('Following files will be compiled:')
    for file_name in file_paths:
        print(file_name)
  
    ##Writing files to a zipfile
    os.chdir('../')
    os.mkdir('output')
    os.chdir(directory)
    with ZipFile(file="../output/"+modnameSpaceless+".lebmod",mode='w',compression=ZIP_BZIP2,compresslevel=9) as zip:
        ##Writing each file one by one
        for file in file_paths:
            zip.write(file)
    ##Change directory back to starting point
    os.chdir('../')
    #https://www.geeksforgeeks.org/change-current-working-directory-with-python/
    ##Remove temporary mod folder
    shutil.rmtree(directory)
  
    print('All files compiled successfully!')

##Compile it
load_mod_config()
compile_mod()
