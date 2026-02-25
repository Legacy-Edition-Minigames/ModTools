##Get amount of entities
#Interaction
execute store result score #Store lem.mt.remove.boxcount if entity @e[type=interaction,tag=lem.mt.remove]
#Players
execute store result score #Store lem.mt.remove.plist if entity @a[tag=lem.mt.remove.held]

##Reload interaction entities if a player leaves
execute if score #Store lem.mt.remove.plist < #Store lem.mt.remove.boxcount run function modtools:tool/remove/reload
