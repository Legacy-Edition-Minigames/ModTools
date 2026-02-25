##Summon AEC
execute align y run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["lem.mapentity","lem.mt.needid","RandomTP","MixedTP"]}

##Set ID
execute as @e[tag=lem.mt.needid] run function modtools:spawn/id

##Display fake player
function modtools:spawn/spawnpoint/display/random

##Run global functions
function modtools:spawn/spawnpoint/global

##Remove spawning entity
kill @s
