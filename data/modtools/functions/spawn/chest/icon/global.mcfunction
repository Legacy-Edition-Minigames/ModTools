##Copy ID from entity to display entity
execute positioned ~ ~1 ~ as @e[type=item_display,tag=lem.mt.powerdisplay,sort=nearest,distance=..1,limit=1] at @s run function modtools:spawn/copyid
