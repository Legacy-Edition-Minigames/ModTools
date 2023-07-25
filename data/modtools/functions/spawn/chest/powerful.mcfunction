##Summon AEC
execute align y run summon area_effect_cloud ~ ~0.5 ~ {Duration:2147483647,Tags:["PowerfulChest","Chest"]}

##Display icon
function modtools:spawn/chest/icon/powerful

##Run global functions
function modtools:spawn/chest/global

##Remove spawning entity
kill @s
