##Set facing directions for corner displays
function modtools:spawn/border/display/corner

##Set facing directions for arrow displays
function modtools:spawn/border/display/arrow

##Copy ID from entity to display entity
execute as @e[type=item_display,tag=lem.mt.border,sort=nearest,distance=..1,limit=2] at @s run function modtools:spawn/copyid

##Refresh colors
execute as @e[tag=lem.mt.border] run function modtools:display/color/refresh
