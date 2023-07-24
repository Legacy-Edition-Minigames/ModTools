##Display fake player
#Central
execute if entity @s[tag=CenterTP] run function modtools:spawn/spawnpoint/display/center
#Random
execute if entity @s[tag=RandomTP] run function modtools:spawn/spawnpoint/display/random

##Set version
scoreboard players set @s lem.mt.version 1
