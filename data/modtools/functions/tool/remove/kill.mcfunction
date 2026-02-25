##Copy PID to storage
scoreboard players operation #Temp lem.mt.pid = @s lem.mt.pid

##Kill unused entity
execute as @e[type=interaction,tag=lem.mt.remove] if score @s lem.mt.pid = #Temp lem.mt.pid run kill @s

##Remove tag
tag @s remove lem.mt.remove.held
