##Set color to dark red
#Tag
tag @s add lem.mt.color.dark_red.override
#Refresh
function modtools:display/color/refresh

##Display glowing
data merge entity @s {Glowing:1b}
