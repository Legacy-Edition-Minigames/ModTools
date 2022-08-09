##Spawn chests
#Center
execute as @e[type=bat,tag=spawncenterchest] at @s run function leb-builder:spawn/chest/center
#Standard
execute as @e[type=bat,tag=spawnstandardchest] at @s run function leb-builder:spawn/chest/standard
#Powerful
execute as @e[type=bat,tag=spawnpowerfulchest] at @s run function leb-builder:spawn/chest/powerful

##Spawnpoints
#Random
execute as @e[type=bat,tag=spawnrandomtp] at @s run function leb-builder:spawn/spawnpoint/random
#Center
execute as @e[type=bat,tag=spawncentertp] at @s run function leb-builder:spawn/spawnpoint/center

##Borders
#Positive
execute as @e[type=bat,tag=spawnborder+] at @s run function leb-builder:spawn/border/positive
#Negative
execute as @e[type=bat,tag=spawnborder-] at @s run function leb-builder:spawn/border/negative

##Center
execute as @e[type=bat,tag=spawncenter] at @s run function leb-builder:spawn/center

##Remove tool
execute as @e[type=bat,tag=removeaec] at @s run function leb-builder:removeaec

##Display particles
function leb-builder:particle

##Loop
schedule function leb-builder:check 5t

##Exit option
execute as @a[scores={4j.buildexit=1..},nbt={SelectedItem:{tag:{BuilderMode:1}}}] run function leb-builder:stop
