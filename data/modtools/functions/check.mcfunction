##Spawn chests
#Center
execute as @e[type=marker,tag=lem.mt.spawncenterchest] at @s run function modtools:spawn/chest/center
#Standard
execute as @e[type=marker,tag=lem.mt.spawnstandardchest] at @s run function modtools:spawn/chest/standard
#Powerful
execute as @e[type=marker,tag=lem.mt.spawnpowerfulchest] at @s run function modtools:spawn/chest/powerful

##Spawnpoints
#Random
execute as @e[type=marker,tag=lem.mt.spawnrandomtp] at @s run function modtools:spawn/spawnpoint/random
#Center
execute as @e[type=marker,tag=lem.mt.spawncentertp] at @s run function modtools:spawn/spawnpoint/center

##Borders
#Positive
execute as @e[type=marker,tag=lem.mt.spawnborder+] at @s run function modtools:spawn/border/positive
#Negative
execute as @e[type=marker,tag=lem.mt.spawnborder-] at @s run function modtools:spawn/border/negative

##Center
execute as @e[type=marker,tag=lem.mt.spawncenter] at @s run function modtools:spawn/center/run

##Remove tool
execute as @e[type=marker,tag=lem.mt.remove] at @s run function modtools:remove

##Display particles
function modtools:particle

##Check for outdated entities
function modtools:updatecheck/run

##Loop
schedule function modtools:check 5t
