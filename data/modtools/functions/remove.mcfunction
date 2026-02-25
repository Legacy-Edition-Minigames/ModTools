##Remove Chest
execute if entity @s[tag=Chest] run fill ~ ~ ~ ~ ~ ~ air replace chest

##Remove display
#Copy ID to storage
scoreboard players operation #Temp lem.mt.id = @s lem.mt.id
#Remove display entity
execute as @e[tag=lem.mt.display] if score @s lem.mt.id = #Temp lem.mt.id at @s run kill @s

##Remove AEC
kill @e[type=area_effect_cloud,distance=..1,limit=1,sort=nearest]

##Remove spawning entity
kill @s
