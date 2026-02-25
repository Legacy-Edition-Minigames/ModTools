##Summon entity
summon interaction ~ ~ ~ {Tags:["lem.mt.remove"],width:4,height:2}

##Copy PID to entity
scoreboard players operation @e[type=interaction,tag=lem.mt.remove,sort=nearest,limit=1] lem.mt.pid = @s lem.mt.pid

##Add tag
tag @s add lem.mt.remove.held
