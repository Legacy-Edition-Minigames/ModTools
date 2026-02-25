##Summon display entity
summon item_display ~ ~0.5 ~ {Tags:["lem.mt.editoronly","lem.mt.display","lem.mt.color.dark_purple","lem.mt.center"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:28}}}

##Copy ID from entity to display entity
execute as @e[tag=lem.mt.center,sort=nearest,distance=..1,limit=1] at @s run function modtools:spawn/copyid

##Refresh colors
execute as @e[tag=lem.mt.center] run function modtools:display/color/refresh
