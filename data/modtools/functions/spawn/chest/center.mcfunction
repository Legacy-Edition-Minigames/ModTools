##Summon AEC
execute align y run summon area_effect_cloud ~ ~0.5 ~ {Duration:2147483647,Tags:["CenterChest","Chest"]}

##Place chest
#North
execute unless block ~ ~ ~ chest if entity @p[y_rotation=-45..44] run setblock ~ ~ ~ chest[facing=north]
#East
execute unless block ~ ~ ~ chest if entity @p[y_rotation=45..134] run setblock ~ ~ ~ chest[facing=east]
#South
execute unless block ~ ~ ~ chest if entity @p[y_rotation=135..-134] run setblock ~ ~ ~ chest[facing=south]
#West
execute unless block ~ ~ ~ chest if entity @p[y_rotation=-135..-44] run setblock ~ ~ ~ chest[facing=west]

##Display icon
function modtools:spawn/chest/icon/center

##Run global functions
function modtools:spawn/chest/global

##Remove spawning entity
kill @s
