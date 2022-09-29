##Tag
tag @s add relog

##Load global actions
function modtools:relog/setup/global

tellraw @s[tag=debug] "joined as new user"
