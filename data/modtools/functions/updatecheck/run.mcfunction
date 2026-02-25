##Chests
#1
execute as @e[type=area_effect_cloud,tag=Chest] unless score @s lem.mt.version matches 0.. at @s positioned ~ ~-0.5 ~ run function modtools:updatecheck/chest/1

##Spawnpoints
#1
execute as @e[type=area_effect_cloud,tag=MixedTP] at @s unless score @s lem.mt.version matches 0.. run function modtools:updatecheck/spawnpoint/1

##Map Center
#1
execute as @e[type=area_effect_cloud,tag=MapCenter] at @s unless score @s lem.mt.version matches 0.. run function modtools:updatecheck/center/1

##Borders
#1
execute as @e[type=area_effect_cloud,tag=BorderEntity] unless score @s lem.mt.version matches 0.. at @s positioned ~ ~-0.5 ~ run function modtools:updatecheck/border/1
