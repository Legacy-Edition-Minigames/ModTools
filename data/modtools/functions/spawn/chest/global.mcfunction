##Place chest
#North
execute unless block ~ ~ ~ chest if entity @p[y_rotation=-45..44] run setblock ~ ~ ~ chest[facing=north]
#East
execute unless block ~ ~ ~ chest if entity @p[y_rotation=45..134] run setblock ~ ~ ~ chest[facing=east]
#South
execute unless block ~ ~ ~ chest if entity @p[y_rotation=135..-134] run setblock ~ ~ ~ chest[facing=south]
#West
execute unless block ~ ~ ~ chest if entity @p[y_rotation=-135..-44] run setblock ~ ~ ~ chest[facing=west]

##Set entity version
scoreboard players set @e[type=area_effect_cloud,sort=nearest,tag=Chest,distance=..1] lem.mt.version 1
