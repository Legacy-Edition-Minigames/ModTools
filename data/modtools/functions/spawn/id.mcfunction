##Get ID
execute as @s unless score @s lem.mt.id matches 1.. store result score @s lem.mt.id run scoreboard players add #Store lem.mt.id 1

##Remove tag
tag @s remove lem.mt.needid
