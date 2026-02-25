##Initialize steps
scoreboard players set @s lem.mt.cast.steps 64

##Move the ray
execute at @s run function modtools:tool/remove/cast/move

##Check if the ray hit a Creeper
execute as @s[tag=hitCreeper] at @s run function modtools:tool/remove/cast/hit

##Destroy the ray (very important!)
kill @s
