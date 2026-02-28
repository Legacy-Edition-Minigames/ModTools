##Get Y values
execute as @e[tag=BorderEntity] at @s store result score @s lem.mt.yvalue run data get entity @s Pos[1]

##Check if borders are invalid
execute if score @e[type=minecraft:area_effect_cloud,limit=1,tag=Border-] lem.mt.yvalue < @e[type=minecraft:area_effect_cloud,limit=1,tag=Border+] lem.mt.yvalue run tellraw @a ["",{"text":"[","bold":true,"color":"dark_red"},{"translate":"lem.generic.warning","bold":true,"color":"dark_red"},{"text":"] ","bold":true,"color":"dark_red"},{"translate":"lem.mt.invalidborders","color":"red"}]
