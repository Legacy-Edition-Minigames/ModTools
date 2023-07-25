##Remove Chest
#Remove power display
execute if entity @e[distance=..1,tag=Chest] positioned ~ ~1.4 ~ run kill @e[distance=..1,tag=lem.mt.powerdisplay]
#Remove block
fill ~ ~ ~ ~ ~ ~ air replace chest

##Remove spawnpoint
execute if entity @e[distance=..1,tag=MixedTP] positioned ~ ~0.55 ~ run kill @e[distance=..1,tag=lem.mt.spawndisplay]

##Remove center
execute if entity @e[distance=..1,tag=MapCenter] run kill @e[distance=..1,tag=lem.mt.center]

##Remove AEC
kill @e[type=area_effect_cloud,distance=..1]

##Remove spawning entity
kill @s