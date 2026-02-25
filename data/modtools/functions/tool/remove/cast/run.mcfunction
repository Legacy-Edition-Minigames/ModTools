##Summon a ray at the caster
summon area_effect_cloud ~ ~ ~ {Duration:1,Tags:[lem.mt.cast.ray]}

##Give caster Tags
tag @s add lem.mt.remove.cast

##Copy PID to ray
scoreboard players operation @e[type=area_effect_cloud,tag=lem.mt.cast.ray,sort=nearest,limit=1] lem.mt.pid = @s lem.mt.pid

##Copy PID to storage
scoreboard players operation #Temp lem.mt.pid = @s lem.mt.pid

##Position the ray at the caster's eyes and copy their facing
execute anchored eyes rotated as @s run tp @e[tag=lem.mt.cast.ray,limit=1,sort=nearest] ^ ^ ^ ~ ~

##Process the ray
execute as @e[tag=lem.mt.cast.ray,limit=1,sort=nearest] run function modtools:tool/remove/cast/process
