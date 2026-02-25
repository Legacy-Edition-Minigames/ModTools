##Spawn chests
#Center
execute as @e[type=marker,tag=lem.mt.spawncenterchest] at @s unless entity @e[type=area_effect_cloud,sort=nearest,limit=1,distance=..0.9] run function modtools:spawn/chest/center
#Standard
execute as @e[type=marker,tag=lem.mt.spawnstandardchest] at @s unless entity @e[type=area_effect_cloud,sort=nearest,limit=1,distance=..0.9] run function modtools:spawn/chest/standard
#Powerful
execute as @e[type=marker,tag=lem.mt.spawnpowerfulchest] at @s unless entity @e[type=area_effect_cloud,sort=nearest,limit=1,distance=..0.9] run function modtools:spawn/chest/powerful

##Spawnpoints
#Random
execute as @e[type=marker,tag=lem.mt.spawnrandomtp] at @s unless entity @e[type=area_effect_cloud,sort=nearest,limit=1,distance=..0.9] run function modtools:spawn/spawnpoint/random
#Center
execute as @e[type=marker,tag=lem.mt.spawncentertp] at @s unless entity @e[type=area_effect_cloud,sort=nearest,limit=1,distance=..0.9] run function modtools:spawn/spawnpoint/center

##Borders
#Positive
execute as @e[type=marker,tag=lem.mt.spawnborder-] at @s unless entity @e[type=area_effect_cloud,sort=nearest,limit=1,distance=..0.9] run function modtools:spawn/border/positive
#Negative
execute as @e[type=marker,tag=lem.mt.spawnborder+] at @s unless entity @e[type=area_effect_cloud,sort=nearest,limit=1,distance=..0.9] run function modtools:spawn/border/negative

##Center
execute as @e[type=marker,tag=lem.mt.spawncenter] at @s unless entity @e[type=area_effect_cloud,sort=nearest,limit=1,distance=..0.9] run function modtools:spawn/center/run

##Remove tool
execute as @e[type=marker,tag=lem.mt.remove] at @s unless entity @e[type=area_effect_cloud,sort=nearest,limit=1,distance=..0.9] run function modtools:remove

##Check for markers that failed to place
execute as @e[type=marker,tag=lem.mt.object] run function modtools:spawn/fail

##Display visuals
function modtools:display/run

##Tool functionality
function modtools:tool/check

##Check for outdated entities
function modtools:updatecheck/run

##Loop
schedule function modtools:check 1t
