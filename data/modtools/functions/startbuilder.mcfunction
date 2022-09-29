##Reset exit score
scoreboard players reset @a 4j.buildexit

##Give items
execute as @a run function modtools:give/check

##Start build check
function modtools:check