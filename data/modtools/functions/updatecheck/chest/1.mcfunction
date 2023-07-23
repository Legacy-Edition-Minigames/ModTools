##Display icon
#Standard
execute if entity @s[tag=StandardChest] run function modtools:spawn/chest/icon/standard
#Center
execute if entity @s[tag=CenterChest] run function modtools:spawn/chest/icon/center
#Powerful
execute if entity @s[tag=PowerfulChest] run function modtools:spawn/chest/icon/powerful

##Set version
scoreboard players set @s lem.mt.version 1
