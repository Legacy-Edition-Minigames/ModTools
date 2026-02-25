##Give highlighted score
scoreboard players set @e[tag=lem.mapentity,sort=nearest,limit=1] lem.mt.remove.highlighted 2

##Remove Object
execute if score @s lem.mt.pid = #Temp lem.mt.pid if entity @a[tag=lem.mt.remove.cast,tag=lem.mt.remove.ready] as @e[tag=lem.mapentity,sort=nearest,limit=1] at @s run function modtools:remove

##Remove tag
tag @a[tag=lem.mt.remove.cast] remove lem.mt.remove.cast