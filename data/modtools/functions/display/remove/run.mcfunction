##Start glowing
#Copy ID to storage
scoreboard players operation #Temp lem.mt.id = @s lem.mt.id
#Run function
execute as @e[tag=lem.mt.display] if score @s lem.mt.id = #Temp lem.mt.id at @s run function modtools:display/remove/start

##Remove glowing if no longer selected
execute if score @s lem.mt.remove.highlighted matches 1 as @e[tag=lem.mt.display] if score @s lem.mt.id = #Temp lem.mt.id at @s run function modtools:display/remove/stop

##Count down score
scoreboard players remove @s lem.mt.remove.highlighted 1
