##Check for if items are already in inventory
execute unless entity @s[nbt={Inventory:[{tag:{BuilderMode:1}}]}] run function modtools:give/run
