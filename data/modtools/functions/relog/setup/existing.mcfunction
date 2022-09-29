##Reset score
scoreboard players reset @s 4j.relog

##Load global actions
function modtools:relog/setup/global

tellraw @s[tag=debug] "joined as existing user"
