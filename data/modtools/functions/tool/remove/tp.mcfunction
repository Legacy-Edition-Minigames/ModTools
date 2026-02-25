##Add tag
tag @s add lem.mt.remove.temp

##Copy PID to storage
scoreboard players operation #Temp lem.mt.pid = @s lem.mt.pid

##TP entity to player
execute as @e[type=interaction,tag=lem.mt.remove] if score @s lem.mt.pid = #Temp lem.mt.pid at @a[tag=lem.mt.remove.temp] run tp ~ ~0.5 ~

##Remove tag
tag @s remove lem.mt.remove.temp
