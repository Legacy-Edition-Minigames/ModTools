import json
import os
import shutil
from zipfile import ZipFile

def extractmod():
    print("Extracting mod archive!")
    with ZipFile(mod_archive, 'r') as zip:
        #Extract files
        zip.extractall(path="4j.modtools-temp")

def loadmodconfig():
    ##Load mod config
    global modconfig
    with open('4j.modtools-temp/config.json', 'r') as modconfigfile:
        modconfig = json.load(modconfigfile)
    #Create spaceless mod name variable
    global modnameSpaceless
    modnameSpaceless = str(modconfig['name']).replace(' ', '-')
    #Create mod ID variable
    global modID
    modID = str(modconfig['id'])
    print("Loaded config for mod "+str(modconfig['name']))

def injectcode():
    print("Attempting to inject to datapack!")
    ##Get map ID
    #Open maprandom file
    filePath = "world/datapacks/4jbattle/data/4jbattle/loot_tables/maprandom.json"
    with open(filePath, "r") as lbFile:
        loot_table = json.load(lbFile)
    #Get Map ID from file and add 1 to it
    maxMap = loot_table["pools"][0]["rolls"]["max"] + 1
    #Save to file
    loot_table["pools"][0]["rolls"]["max"] = maxMap
    with open(filePath, "w") as lbFile:
        json.dump(loot_table, lbFile)
    print("MapID: "+str(maxMap))
    #Close file
    lbFile.close
    ##Write to map teleport file
    # Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/game/setup/teleport/load.mcfunction"
    lbFile = open(filePath, "a")
    # Write header
    lbFile.write("\n##" + str(modconfig['name']))
    baseCmd = "execute if score #Store 4j.map matches " + str(
        maxMap) + " if score #Store 4j.maptype matches $MAPSIZE$ in 4jbattle:$MAPNAME$ run tp @s " + str(
        modconfig['centercoords'])
    # Write teleport coordinates
    if modconfig['hassmall']:
        lbFile.write("\n#Small\n"+baseCmd.replace("$MAPSIZE$", "1").replace("$MAPNAME$", modID + "_small"))
    else:
        lbFile.write("\n#Small\n"+baseCmd.replace("$MAPSIZE$", "1").replace("$MAPNAME$", modID))
    if modconfig['haslarge']:
        lbFile.write("\n#Large\n"+baseCmd.replace("$MAPSIZE$", "2").replace("$MAPNAME$", modID))
    else:
        lbFile.write("\n#Large\n"+baseCmd.replace("$MAPSIZE$", "2").replace("$MAPNAME$", modID))
    if modconfig['haslargeplus']:
        lbFile.write("\n#Large+\n"+baseCmd.replace("$MAPSIZE$", "3").replace("$MAPNAME$", modID + "_largeplus"))
    else:
        lbFile.write("\n#Large+\n"+baseCmd.replace("$MAPSIZE$", "3").replace("$MAPNAME$", modID))
    if modconfig['hasremastered']:
        lbFile.write("\n#Remastered\n"+baseCmd.replace("$MAPSIZE$", "4").replace("$MAPNAME$", modID + "_remastered"))
    else:
        lbFile.write("\n#Remastered\n"+baseCmd.replace("$MAPSIZE$", "4").replace("$MAPNAME$", modID))
    # Close file
    lbFile.close
    ##Write to mapreset file
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/game/mapreset/new.mcfunction"
    lbFile = open(filePath, "a")
    #Write header
    lbFile.write("\n##"+str(modconfig['name']))
    baseCmd = "execute if score #Store 4j.map matches " + str(
        maxMap) + " if score #Store 4j.maptype matches $MAPSIZE$ in 4jbattle:$MAPNAME$ run function 4jbattle:game/mapreset/$MAPNAME$"
    #Write code to point to resetfiles
    if modconfig['hassmall']:
        lbFile.write("\n#Small\n"+baseCmd.replace("$MAPSIZE$", "1").replace("$MAPNAME$", modID + "_small"))
    else:
        lbFile.write("\n#Small\n"+baseCmd.replace("$MAPSIZE$", "1").replace("$MAPNAME$", modID))
    if modconfig['haslarge']:
        lbFile.write("\n#Large\n"+baseCmd.replace("$MAPSIZE$", "2").replace("$MAPNAME$", modID))
    else:
        lbFile.write("\n#Large\n"+baseCmd.replace("$MAPSIZE$", "2").replace("$MAPNAME$", modID))
    if modconfig['haslargeplus']:
        lbFile.write("\n#Large+\n"+baseCmd.replace("$MAPSIZE$", "3").replace("$MAPNAME$", modID + "_largeplus"))
    else:
        lbFile.write("\n#Large+\n"+baseCmd.replace("$MAPSIZE$", "3").replace("$MAPNAME$", modID))
    if modconfig['hasremastered']:
        lbFile.write("\n#Remastered\n"+baseCmd.replace("$MAPSIZE$", "4").replace("$MAPNAME$", modID + "_remastered"))
    else:
        lbFile.write("\n#Remastered\n"+baseCmd.replace("$MAPSIZE$", "4").replace("$MAPNAME$", modID))
    #Close file
    lbFile.close
    ##Add resetfiles
    #Small
    filePath = "4j.modtools-temp/resetfile/mcfunction/small.mcfunction"
    if os.path.exists(filePath):
        #Open file for reading
        lbFile = open(filePath, "r")
        #Set variables for replacing
        stringToReplace = "$MODID$"
        replaceWith = "4jbattle:"+modID+"_small"
        #Read data
        fileContents = lbFile.read()
        #Replace the text
        fileContents = fileContents.replace(stringToReplace, replaceWith)
        #Open file for writing
        lbFile = open(filePath, "w")
        #Write new file
        lbFile.write(fileContents)
        #Close file
        lbFile.close
        #Open file
        lbFile = open(filePath, "r")
        shutil.copyfile(filePath, "world/datapacks/4jbattle/data/4jbattle/functions/game/mapreset/"+modID+"small.mcfunction")
    #Large
    filePath = "4j.modtools-temp/resetfile/mcfunction/large.mcfunction"
    if os.path.exists(filePath):
        #Open file for reading
        lbFile = open(filePath, "r")
        #Set variables for replacing
        stringToReplace = "$MODID$"
        replaceWith = "4jbattle:"+modID
        #Read data
        fileContents = lbFile.read()
        #Replace the text
        fileContents = fileContents.replace(stringToReplace, replaceWith)
        #Open file for writing
        lbFile = open(filePath, "w")
        #Write new file
        lbFile.write(fileContents)
        #Close file
        lbFile.close
        #Open file
        lbFile = open(filePath, "r")
        shutil.copyfile(filePath, "world/datapacks/4jbattle/data/4jbattle/functions/game/mapreset/"+modID+".mcfunction")
    #Large+
    filePath = "4j.modtools-temp/resetfile/mcfunction/largeplus.mcfunction"
    if os.path.exists(filePath):
        #Open file for reading
        lbFile = open(filePath, "r")
        #Set variables for replacing
        stringToReplace = "$MODID$"
        replaceWith = "4jbattle:"+modID+"_largeplus"
        #Read data
        fileContents = lbFile.read()
        #Replace the text
        fileContents = fileContents.replace(stringToReplace, replaceWith)
        #Open file for writing
        lbFile = open(filePath, "w")
        #Write new file
        lbFile.write(fileContents)
        #Close file
        lbFile.close
        #Open file
        lbFile = open(filePath, "r")
        shutil.copyfile(filePath, "world/datapacks/4jbattle/data/4jbattle/functions/game/mapreset/"+modID+"largeplus.mcfunction")
    #Remastered
    filePath = "4j.modtools-temp/resetfile/mcfunction/remastered.mcfunction"
    if os.path.exists(filePath):
        #Open file for reading
        lbFile = open(filePath, "r")
        #Set variables for replacing
        stringToReplace = "$MODID$"
        replaceWith = "4jbattle:"+modID+"_remastered"
        #Read data
        fileContents = lbFile.read()
        #Replace the text
        fileContents = fileContents.replace(stringToReplace, replaceWith)
        #Open file for writing
        lbFile = open(filePath, "w")
        #Write new file
        lbFile.write(fileContents)
        #Close file
        lbFile.close
        #Open file
        lbFile = open(filePath, "r")
        shutil.copyfile(filePath, "world/datapacks/4jbattle/data/4jbattle/functions/game/mapreset/"+modID+"remastered.mcfunction")
    ##Copy reset structure files
    #Small
    filePath = "4j.modtools-temp/resetfile/structure/small.nbt"
    if os.path.exists(filePath):
        shutil.copyfile(filePath, "world/generated/4jbattle/structures/"+modID+"_small.nbt")
    #Large
    filePath = "4j.modtools-temp/resetfile/structure/large.nbt"
    if os.path.exists(filePath):
        shutil.copyfile(filePath, "world/generated/4jbattle/structures/"+modID+".nbt")
    #Large+
    filePath = "4j.modtools-temp/resetfile/structure/largeplus.nbt"
    if os.path.exists(filePath):
        shutil.copyfile(filePath, "world/generated/4jbattle/structures/"+modID+"_largeplus.nbt")
    #Remastered
    filePath = "4j.modtools-temp/resetfile/structure/remastered.nbt"
    if os.path.exists(filePath):
        shutil.copyfile(filePath, "world/generated/4jbattle/structures/"+modID+"_remastered.nbt")
    ##Have the map get loaded by mapdecider
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/loadenabled.mcfunction"
    lbFile = open(filePath, "a")
    #Write header
    lbFile.write("\n#"+str(modconfig['name']))
    #Write code to enable the map if its enabled
    lbFile.write("\nscoreboard players operation #"+modID+" 4j.enablemap = #"+modID+" 4j.setenablemap")
    #Close file
    lbFile.close
    ##Allow map to be detected from voting
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/findhighest.mcfunction"
    lbFile = open(filePath, "a")
    #Write header
    lbFile.write("\n#"+str(modconfig['name']))
    #Add code for finding the vote
    lbFile.write("\nexecute if score #"+modID+" 4j.enablemap matches 1 if score §aM:"+modnameSpaceless+" 4j.mapvote = #highestScore 4j.mapvote run scoreboard players set #Store 4j.map "+str(maxMap))
    #Close file
    lbFile.close
    ##Allow map to be detected from random chance
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/randommod.mcfunction"
    lbFile = open(filePath, "a")
    #Write header
    lbFile.write("\n#"+str(modconfig['name']))
    #Add code for finding the vote
    lbFile.write("\nexecute if score #"+modID+" 4j.enablemap matches 1 if score #Store 4j.maprandom matches "+str(maxMap)+" run scoreboard players set #Store 4j.map "+str(maxMap))
    #Close file
    lbFile.close
    ##Allow users to vote for the map
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/vote/check/mods.mcfunction"
    lbFile = open(filePath, "a")
    #Write header
    lbFile.write("\n##add 1 to "+str(modconfig['name'])+"'s vote count if voted for")
    #If the user voted already
    lbFile.write("\n#If user has voted for this map\nexecute if score #"+modID+" 4j.enablemap matches 1 as @a[scores={4j.playermapvote="+str(maxMap)+"},tag=vote"+modID+"] run function 4jbattle:mapdecider/vote/error")
    #IF the user hasn't voted
    lbFile.write("\n#If the user hasnt voted for this map yet\nexecute if score #"+modID+" 4j.enablemap matches 1 as @a[scores={4j.playermapvote="+str(maxMap)+"}] run function 4jbattle:mapdecider/vote/add/"+modID)
    #Close file
    lbFile.close
    ##Load the map into the sidebar if enabeld
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/vote/load.mcfunction"
    lbFile = open(filePath, "a")
    #Write header
    lbFile.write("\n#"+str(modconfig['name']))
    #Write code to load to sidebar
    lbFile.write("\n#"+str(modconfig['name'])+"\nexecute if score #"+modID+" 4j.enablemap matches 1 run scoreboard players set §aM:"+modnameSpaceless+" 4j.mapvote 0")
    #Close file
    lbFile.close
    ##Remove map from vote if another map is voted for
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/vote/rmoldvote.mcfunction"
    lbFile = open(filePath, "a")
    #Write code to remove vote
    lbFile.write("\n##Remove "+str(modconfig['name'])+"map vote\nexecute if entity @s[tag=vote"+modID+"] run scoreboard players remove §aM:"+modnameSpaceless+" 4j.mapvote 1")
    #Close file
    lbFile.close
    ##Remove tag from user when switching votes
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/vote/tagreset.mcfunction"
    lbFile = open(filePath, "a")
    #Write code to remove tag
    lbFile.write("\n##"+str(modconfig['name'])+"\ntag @s remove vote"+modID)
    #Close file
    lbFile.close
    ##Create file to execute when map is voted for
    #Create file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/vote/add/"+modID+".mcfunction"
    lbFile = open(filePath, "w")
    #Write code to add the vote
    lbFile.write("##Add vote\nscoreboard players add §aM:"+modnameSpaceless+" 4j.mapvote 1\n\n##Run global vote commands\nfunction 4jbattle:mapdecider/vote/add/global\n\n##Mark as voted\ntag @s add vote"+modID)
    #Close file
    lbFile.close
    ##Add map to map list
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/vote/modmenu/main.mcfunction"
    lbFile = open(filePath, "a")
    #Write code to display the button
    maxMapDisable = maxMap + 2000
    lbFile.write("\nexecute if score #"+modID+" 4j.enablemap matches 1 run tellraw @s [\"\",{\"text\":\"["+str(modconfig['name'])+"] \",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.playermapvote set -"+str(maxMapDisable)+"\"}},{\"text\":\"by "+str(modconfig['authors'])+"\",\"italic\":true,\"color\":\"dark_aqua\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.playermapvote set -"+str(maxMapDisable)+"\"}}]")
    #Close file
    lbFile.close
    ##Add redirect to open GUI page for the mod
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/vote/modmenu/map.mcfunction"
    lbFile = open(filePath, "a")
    #Write redirect code into the file
    lbFile.write("\n##"+str(modconfig['name'])+"\nexecute if score @s 4j.playermapvote matches -"+str(maxMapDisable)+" run function 4jbattle:mapdecider/vote/modmenu/map/"+modID)
    #Close file
    lbFile.close
    ##Add voting page for the map
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/mapdecider/vote/modmenu/map/"+modID+".mcfunction"
    lbFile = open(filePath, "w")
    #Write header
    lbFile.write("##Display header\ntellraw @s {\"text\":\""+str(modconfig['name'])+" by "+str(modconfig['authors'])+"\\nVersion: "+str(modconfig['version'])+"\",\"color\":\"dark_aqua\"}")
    #Write description
    lbFile.write("\n\n##Display description\ntellraw @s {\"text\":\"\\n"+str(modconfig['description'])+"\\n\",\"color\":\"dark_aqua\"}")
    #Write vote button
    lbFile.write("\n\n##Display vote button\ntellraw @s [\"\",{\"text\":\"[\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.playermapvote set "+str(maxMap)+"\"}},{\"translate\":\"4j.mapdecider.menu.vote\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.playermapvote set "+str(maxMap)+"\"}},{\"text\":\"]\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.playermapvote set "+str(maxMap)+"\"}}]")
    #Run the global functions
    lbFile.write("\n\n##Run global functions\nfunction 4jbattle:mapdecider/vote/modmenu/map/global")
    ##Add map to the GUI to enable/disable maps
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/menu/load/host/mapgui/mods.mcfunction"
    lbFile = open(filePath, "a")
    #Write ui code
    lbFile.write("\nexecute if score #"+modID+" 4j.setenablemap matches 1 run tellraw @s [\"\",{\"text\":\"[\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.gamecfg set "+str(maxMapDisable)+"\"}},{\"text\":\"✔\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.gamecfg set "+str(maxMapDisable)+"\"}},{\"text\":\"] "+str(modconfig['name'])+"\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.gamecfg set "+str(maxMapDisable)+"\"}}]")
    maxMapEnable = maxMap + 3000
    lbFile.write("\nexecute if score #"+modID+" 4j.setenablemap matches 0 run tellraw @s [\"\",{\"text\":\"[\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.gamecfg set "+str(maxMapEnable)+"\"}},{\"text\":\"❌\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.gamecfg set "+str(maxMapEnable)+"\"}},{\"text\":\"] "+str(modconfig['name'])+"\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger 4j.gamecfg set "+str(maxMapEnable)+"\"}}]")
    #Close file
    lbFile.close
    ##Add the backend code to allow changing of the enabled/disabled state
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/menu/configure/map.mcfunction"
    lbFile = open(filePath, "a")
    #Write code for allowing the changes
    lbFile.write("\n##Disable "+str(modconfig['name'])+" if set to "+str(maxMapDisable)+"\nexecute if score #Store 4j.mapcount matches 2.. if score #"+modID+" 4j.setenablemap matches 1 as @s[scores={4j.gamecfg="+str(maxMapDisable)+"}] run function 4jbattle:menu/load/host/map/"+modID+"/disable")
    lbFile.write("\n##Enable "+str(modconfig['name'])+" if set to "+str(maxMapEnable)+"\nexecute unless score #"+modID+" 4j.setenablemap matches 1 as @s[scores={4j.gamecfg="+str(maxMapEnable)+"}] run function 4jbattle:menu/load/host/map/"+modID+"/enable")
    #Close file
    lbFile.close
    ##Enable map by default
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/menu/load/host/defaults.mcfunction"
    lbFile = open(filePath, "a")
    #Write code to enable the map
    lbFile.write("\nscoreboard players set #"+modID+" 4j.setenablemap 1")
    #Close file
    lbFile.close
    ##Set max map count
    #Open file for reading
    lbFile = open(filePath, "r")
    #Set variables for replacing
    stringToReplace = "scoreboard players set #Store 4j.mapcount "+str(maxMap -1)
    replaceWith = "scoreboard players set #Store 4j.mapcount "+str(maxMap)
    #Read data
    fileContents = lbFile.read()
    #Replace the text
    fileContents = fileContents.replace(stringToReplace, replaceWith)
    #Open file for writing
    lbFile = open(filePath, "w")
    #Write new file
    lbFile.write(fileContents)
    #Close file
    lbFile.close
    ##Create files for enabling the map
    #Create folder
    os.mkdir("world/datapacks/4jbattle/data/4jbattle/functions/menu/load/host/map/"+modID)
    #Create file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/menu/load/host/map/"+modID+"/enable.mcfunction"
    lbFile = open(filePath, "w")
    #Write code to enable the map
    lbFile.write("##Enable map\nscoreboard players set #"+modID+" 4j.setenablemap 1\n\n##Increase mapcount\nscoreboard players add #Store 4j.mapcount 1\n\n##Open menu\nfunction 4jbattle:menu/load/host/mapgui/main")
    #Close file
    lbFile.close
    ##Create files for disabling the map
    #Create file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/menu/load/host/map/"+modID+"/disable.mcfunction"
    lbFile = open(filePath, "w")
    #Write code to disable the map
    lbFile.write("##Disable map\nscoreboard players set #"+modID+" 4j.setenablemap 0\n\n##Decrease mapcount\nscoreboard players remove #Store 4j.mapcount 1\n\n##Open menu\nfunction 4jbattle:menu/load/host/mapgui/main")
    #Close file
    lbFile.close
    ##Set pack to load
    #Open file
    filePath = "world/datapacks/4jbattle/data/4jbattle/functions/game/resource/load/load.mcfunction"
    lbFile = open(filePath, "a")
    #Get pack ID
    if str(modconfig['pack'])=="vanilla":
        packID = 0
    if str(modconfig['pack'])=="western":
        packID = 1
    if str(modconfig['pack'])=="plastic":
        packID = 2
    if str(modconfig['pack'])=="fantasy":
        packID = 3
    if str(modconfig['pack'])=="city":
        packID = 4
    if str(modconfig['pack'])=="greek":
        packID = 5
    if str(modconfig['pack'])=="steampunk":
        packID = 6
    if str(modconfig['pack'])=="chinese":
        packID = 7
    if str(modconfig['pack'])=="halloween":
        packID = 8
    if str(modconfig['pack'])=="festive":
        packID = 9
    if str(modconfig['pack'])=="fallout":
        packID = 10
    #Write pack ID into file
    if packID > 0:
        lbFile.write("\n#"+str(modconfig['name'])+"\nexecute if score #Store 4j.map matches "+str(maxMap)+" run scoreboard players set #Store 4j.pack "+str(packID))
    #Close file
    lbFile.close

def copyworld():
    print("Copying world files!")
    ##Copy files to world folder
    #data, entities, poi, region
    if modconfig['hassmall']:
        try:
            shutil.copytree("4j.modtools-temp/world/small","world/dimensions/4jbattle/"+modID+"_small")
        except(FileNotFoundError):
            print("Small map type not found!")
    if modconfig['haslarge']:
        try:
            shutil.copytree("4j.modtools-temp/world/large","world/dimensions/4jbattle/"+modID)
        except(FileNotFoundError):
            print("Large map type not found!")
    if modconfig['haslargeplus']:
        try:
            shutil.copytree("4j.modtools-temp/world/largeplus","world/dimensions/4jbattle/"+modID+"_largeplus")
        except(FileNotFoundError):
            print("Large+ map type not found!")
    if modconfig['hasremastered']:
        try:
            shutil.copytree("4j.modtools-temp/world/remastered","world/dimensions/4jbattle/"+modID+"_remastered")
        except(FileNotFoundError):
            print("Remastered map type not found!")
    #Dimension data
    if modconfig['hassmall']:
        shutil.copyfile("4j.modtools-temp/world/dimension.json","world/datapacks/4jbattle/data/4jbattle/dimension/"+modID+"_small.json")
        shutil.copyfile("4j.modtools-temp/world/dimension_type.json","world/datapacks/4jbattle/data/4jbattle/dimension_type/"+modID+"_small.json")
    if modconfig['haslarge']:
        shutil.copyfile("4j.modtools-temp/world/dimension.json","world/datapacks/4jbattle/data/4jbattle/dimension/"+modID+".json")
        shutil.copyfile("4j.modtools-temp/world/dimension_type.json","world/datapacks/4jbattle/data/4jbattle/dimension_type/"+modID+".json")
    if modconfig['haslargeplus']:
        shutil.copyfile("4j.modtools-temp/world/dimension.json","world/datapacks/4jbattle/data/4jbattle/dimension/"+modID+"_largeplus.json")
        shutil.copyfile("4j.modtools-temp/world/dimension_type.json","world/datapacks/4jbattle/data/4jbattle/dimension_type/"+modID+"_largeplus.json")
    if modconfig['hasremastered']:
        shutil.copyfile("4j.modtools-temp/world/dimension.json","world/datapacks/4jbattle/data/4jbattle/dimension/"+modID+"_remastered.json")
        shutil.copyfile("4j.modtools-temp/world/dimension_type.json","world/datapacks/4jbattle/data/4jbattle/dimension_type/"+modID+"_remastered.json")

for fileList in os.listdir("lebmods/"):
    if fileList.endswith(".lebmod"):
        mod_archive = "lebmods/"+str(fileList)
        print("Installing mod: "+mod_archive)
        ##Extract the mod
        extractmod()
        ##Load the config of the mod
        loadmodconfig()
        if os.path.exists("world/datapacks/4jbattle/data/4jbattle/dimension/"+modID+".json"):
            print("This mod is already installed! Skipping...")
        else:
            ##Inject code into the datapack
            injectcode()
            ##Copy world data
            copyworld()
            print("Installed mod "+str(modconfig['name']))
        ##Remove temp directory
        shutil.rmtree("4j.modtools-temp")

print("Done!")
