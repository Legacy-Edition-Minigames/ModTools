##Copy ID from entity to display entity
execute as @e[type=item_display,tag=lem.mt.spawndisplay,sort=nearest,distance=..1,limit=1] at @s run function modtools:spawn/copyid
