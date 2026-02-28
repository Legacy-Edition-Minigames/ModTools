##Check for objects
execute unless score @s lem.mt.sneak matches 1.. at @s run function modtools:tool/remove/cast/run

##Disable arm swing animation
effect give @s minecraft:haste 1 100 true

##Spawn entity
execute if entity @s[tag=!lem.mt.remove.held] run function modtools:tool/remove/spawn

##TP entity to player
function modtools:tool/remove/tp
