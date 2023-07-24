##Summon AEC
execute align y run summon area_effect_cloud ~ ~ ~ {Duration:2147483647,Tags:["CenterTP","MixedTP"]}

##Display fake player
function modtools:spawn/spawnpoint/display/center

##Run global functions
function modtools:spawn/spawnpoint/global

##Remove spawning entity
kill @s