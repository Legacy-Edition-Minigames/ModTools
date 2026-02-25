##Summon AEC
execute align y run summon area_effect_cloud ~ ~0.5 ~ {Duration:2147483647,Tags:["lem.mapentity","lem.mt.needid","StandardChest","Chest"]}

##Set ID
execute as @e[tag=lem.mt.needid] run function modtools:spawn/id

##Display icon
function modtools:spawn/chest/icon/standard

##Run global functions
function modtools:spawn/chest/global

##Remove spawning entity
kill @s
