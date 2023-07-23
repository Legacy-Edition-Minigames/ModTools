##Clear old items
clear @a ghast_spawn_egg{BuilderMode:1}

##Check for if items are already in inventory
execute unless entity @s[nbt={Inventory:[{tag:{lem.mt.editoritem:1}}]}] run function modtools:give/run
