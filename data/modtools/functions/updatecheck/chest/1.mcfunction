##Set ID
function modtools:spawn/id

##Give Map Entity tag
tag @s add lem.mapentity

##Display icon
#Standard
execute if entity @s[tag=StandardChest] run function modtools:spawn/chest/icon/standard
#Center
execute if entity @s[tag=CenterChest] run function modtools:spawn/chest/icon/center
#Powerful
execute if entity @s[tag=PowerfulChest] run function modtools:spawn/chest/icon/powerful

##Set version
scoreboard players set @s lem.mt.version 1
