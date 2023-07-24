##Summon display entity
summon item_display ~ ~0.5 ~ {Tags:["lem.mt.editoronly","lem.mt.spawndisplay"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:2}}}

##Face display entity at spawn
execute as @e[tag=lem.mt.spawndisplay,sort=nearest,distance=..1] at @s facing entity @e[tag=MapCenter] eyes run tp @s ~ ~ ~ ~ 0
