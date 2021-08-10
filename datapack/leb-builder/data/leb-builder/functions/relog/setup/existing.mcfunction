##Reset score
scoreboard players reset @s 4j.relog

##Load global actions
function leb-builder:relog/setup/global

tellraw @s[tag=debug] "joined as existing user"
