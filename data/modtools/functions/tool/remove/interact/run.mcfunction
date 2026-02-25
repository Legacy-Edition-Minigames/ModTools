##Copy PID to storage
scoreboard players operation #Temp lem.mt.pid = @s lem.mt.pid

##Cast ray to object
execute as @a[tag=lem.mt.remove.held] if score @s lem.mt.pid = #Temp lem.mt.pid at @s run function modtools:tool/remove/run
