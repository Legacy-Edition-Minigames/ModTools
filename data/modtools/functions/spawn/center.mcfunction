##Remove previous map center entity
kill @e[type=area_effect_cloud,tag=MapCenter]

##Summon AEC
execute align y run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["MapCenter"]}

##Update fakeplayer positions
execute as @e[tag=lem.mt.spawndisplay] at @s facing entity @e[tag=MapCenter] eyes run tp @s ~ ~ ~ ~ 0

##Remove spawning entity
kill @s