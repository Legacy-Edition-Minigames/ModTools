##Remove glowing
data merge entity @s {Glowing:0b}

##Remove color
#Tag
tag @s remove lem.mt.color.dark_red.override
#Team
team leave @s
#Refresh
function modtools:display/color/refresh
