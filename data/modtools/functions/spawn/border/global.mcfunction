##Set entity version
scoreboard players set @e[type=area_effect_cloud,sort=nearest,tag=BorderEntity,distance=..1] lem.mt.version 1

##Check for invalid borders
function modtools:spawn/border/check
