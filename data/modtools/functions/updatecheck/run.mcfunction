##Chests
execute as @e[tag=Chest] at @s positioned ~ ~-0.5 ~ unless score @s lem.mt.version matches 0.. run function modtools:updatecheck/chest/1
