##Remove previous border entity
kill @e[type=area_effect_cloud,tag=Border+]

##Summon AEC
execute align y run summon area_effect_cloud ~ ~0.5 ~ {Duration:2147483647,Tags:["lem.mapentity","lem.mt.needid","Border+","BorderEntity"]}

##Set ID
execute as @e[tag=lem.mt.needid] run function modtools:spawn/id

##Display corner
function modtools:spawn/border/display/negative

##Run global functions
function modtools:spawn/border/global

##Remove spawning entity
kill @s