###ModTools installer
###This file creates all required scoreboards and such for the datapack to function properly
##Relog detection
scoreboard objectives add lem.mt.relog minecraft.custom:minecraft.leave_game

##Version for entities
scoreboard objectives add lem.mt.version dummy

##RNG
scoreboard objectives add lem.mt.random dummy

##Temp
scoreboard objectives add lem.mt.temp dummy

##Entity position
scoreboard objectives add lem.mt.pos dummy

##Player IDs
scoreboard objectives add lem.mt.pid dummy

##Raycast steps
scoreboard objectives add lem.mt.cast.steps dummy

##Remove tool highlight counter
scoreboard objectives add lem.mt.remove.highlighted dummy

##Amount of Remove Tool interaction boxes
scoreboard objectives add lem.mt.remove.boxcount dummy

##Count of players using remove tool
scoreboard objectives add lem.mt.remove.plist dummy

##Object IDs
scoreboard objectives add lem.mt.id dummy

##Green display
team add lem.mt.green
team modify lem.mt.green color green

##Red display
team add lem.mt.red
team modify lem.mt.red color red

##Dark red display
team add lem.mt.dark_red
team modify lem.mt.dark_red color dark_red

##Dark purple display
team add lem.mt.dark_purple
team modify lem.mt.dark_purple color dark_purple
