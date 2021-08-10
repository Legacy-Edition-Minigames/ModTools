##Clear schedule
schedule clear leb-builder:check

##Reset exit score
scoreboard players reset @a 4j.buildexit

##Remove items
#Spawning items
clear @a ghast_spawn_egg{BuilderMode:1}
#Exit option
clear @a carrot_on_a_stick{BuilderMode:1}

##Display message
tellraw @a ["",{"text":"Exiting Builder mode!","color":"blue"},"\n",{"text":"Builder mode stopped by ","color":"blue"},{"selector":"@s ","color":"dark_aqua"}]