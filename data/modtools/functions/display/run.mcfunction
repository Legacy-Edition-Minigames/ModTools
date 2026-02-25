##Give corners glowing when item is held
execute if entity @a[nbt={SelectedItem:{id:"minecraft:ghast_spawn_egg",tag:{lem.mt.border:1}}}] as @e[type=item_display,tag=lem.mt.border] run data merge entity @s {Glowing:1b}

##Remove glowing from corners when nobody is holding the item
execute if entity @e[type=item_display,tag=lem.mt.border,nbt={Glowing:1b}] unless entity @a[nbt={SelectedItem:{id:"minecraft:ghast_spawn_egg",tag:{lem.mt.border:1}}}] as @e[type=item_display,tag=lem.mt.border] run data merge entity @s {Glowing:0b}

##Give map center glowing when item is held
execute if entity @a[nbt={SelectedItem:{id:"minecraft:ghast_spawn_egg",tag:{lem.mt.center:1}}}] as @e[type=item_display,tag=lem.mt.center] run data merge entity @s {Glowing:1b}

##Remove glowing from map center when nobody is holding the item
execute if entity @e[type=item_display,tag=lem.mt.center,nbt={Glowing:1b}] unless entity @a[nbt={SelectedItem:{id:"minecraft:ghast_spawn_egg",tag:{lem.mt.center:1}}}] as @e[type=item_display,tag=lem.mt.center] run data merge entity @s {Glowing:0b}

##Give objects remove glow if highlighted
execute as @e[tag=lem.mapentity,scores={lem.mt.remove.highlighted=1..}] at @s run function modtools:display/remove/run

##Give everything glowing when sneaking
execute if entity @a[predicate=modtools:sneaking,nbt={SelectedItem:{id:"minecraft:ghast_spawn_egg",tag:{lem.mt.remove:1}}}] as @e[type=item_display,tag=lem.mt.display,tag=!lem.mt.sneakshow] run function modtools:display/sneakshow/add

##Stop glowing when nobody is sneaking
execute if entity @e[type=item_display,tag=lem.mt.display,tag=lem.mt.sneakshow] unless entity @a[predicate=modtools:sneaking,nbt={SelectedItem:{id:"minecraft:ghast_spawn_egg",tag:{lem.mt.remove:1}}}] as @e[type=item_display,tag=lem.mt.display] run function modtools:display/sneakshow/remove
