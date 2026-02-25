##Remove tool
#Holding
execute as @a[nbt={SelectedItem:{tag:{lem.mt.remove:1}}}] run function modtools:tool/remove/held
#Interaction
execute as @e[type=interaction,tag=lem.mt.remove] run function modtools:tool/remove/interact/check
#Remove entity
execute as @a[tag=lem.mt.remove.held] unless entity @s[nbt={SelectedItem:{tag:{lem.mt.remove:1}}}] run function modtools:tool/remove/kill
#Reload on disconnect
execute if entity execute as @e[type=interaction,tag=lem.mt.remove] run function modtools:tool/remove/interact/playercheck
