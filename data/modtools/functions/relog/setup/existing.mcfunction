##Reset score
scoreboard players reset @s lem.mt.relog

##Load global actions
function modtools:relog/setup/global

tellraw @s[tag=lem.mt.debug] "joined as existing user"
