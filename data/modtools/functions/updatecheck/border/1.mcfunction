##Set ID
function modtools:spawn/id

##Give Map Entity tag
tag @s add lem.mapentity

##Display border corners
#Positive
execute if entity @s[tag=Border-] run function modtools:spawn/border/display/positive
#Negative
execute if entity @s[tag=Border+] run function modtools:spawn/border/display/negative

##Set version
scoreboard players set @s lem.mt.version 1
