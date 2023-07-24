##Get random number
execute store result score #lem.mt.store lem.mt.random run loot spawn ~ -2 ~ loot modtools:random/spawndisplay

##Summon display entity
#Boxer
execute if score #lem.mt.store lem.mt.random matches 1 run summon item_display ~ ~0.55 ~ {Tags:["lem.mt.editoronly","lem.mt.spawndisplay"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:20}}}
#Cyclist
execute if score #lem.mt.store lem.mt.random matches 2 run summon item_display ~ ~0.55 ~ {Tags:["lem.mt.editoronly","lem.mt.spawndisplay"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:21}}}
#Default
execute if score #lem.mt.store lem.mt.random matches 3 run summon item_display ~ ~0.55 ~ {Tags:["lem.mt.editoronly","lem.mt.spawndisplay"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:22}}}
#Dev
execute if score #lem.mt.store lem.mt.random matches 4 run summon item_display ~ ~0.55 ~ {Tags:["lem.mt.editoronly","lem.mt.spawndisplay"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:23}}}
#Prisoner
execute if score #lem.mt.store lem.mt.random matches 5 run summon item_display ~ ~0.55 ~ {Tags:["lem.mt.editoronly","lem.mt.spawndisplay"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:24}}}
#Regional
execute if score #lem.mt.store lem.mt.random matches 6 run summon item_display ~ ~0.55 ~ {Tags:["lem.mt.editoronly","lem.mt.spawndisplay"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:25}}}
#Tennis
execute if score #lem.mt.store lem.mt.random matches 7 run summon item_display ~ ~0.55 ~ {Tags:["lem.mt.editoronly","lem.mt.spawndisplay"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:26}}}
#Tuxedo
execute if score #lem.mt.store lem.mt.random matches 8 run summon item_display ~ ~0.55 ~ {Tags:["lem.mt.editoronly","lem.mt.spawndisplay"],item:{id:"minecraft:ghast_spawn_egg",Count:1b,tag:{CustomModelData:27}}}

##Face display entity at spawn
execute as @e[tag=lem.mt.spawndisplay,sort=nearest,distance=..1] at @s facing entity @e[tag=MapCenter] eyes run tp @s ~ ~ ~ ~ 0
