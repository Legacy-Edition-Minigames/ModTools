##Reset exit score
scoreboard players reset @a 4j.buildexit

##Give items
execute as @a run function leb-builder:give

##Start build check
function leb-builder:check