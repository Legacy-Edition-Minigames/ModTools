##Detect right click 
execute on target run function modtools:tool/remove/interact/run

##Detect left click
execute on attacker run function modtools:tool/remove/interact/run

##Remove interaction data
data remove entity @s interaction
data remove entity @s attack
