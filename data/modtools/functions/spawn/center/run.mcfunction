##Remove previous map center entity
#AEC
kill @e[type=area_effect_cloud,tag=MapCenter]
#Display Entity
kill @e[type=item_display,tag=lem.mt.center]

##Summon AEC
execute align y run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["MapCenter"]}

##Display center object
function modtools:spawn/center/display

##Update fakeplayer positions
execute as @e[tag=lem.mt.spawndisplay] at @s facing entity @e[tag=MapCenter] eyes run tp @s ~ ~ ~ ~ 0

##Set entity version
scoreboard players set @e[type=area_effect_cloud,sort=nearest,tag=MapCenter,distance=..1] lem.mt.version 1

##Remove spawning entity
kill @s