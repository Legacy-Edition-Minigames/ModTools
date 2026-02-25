##Give tag
tag @s add lem.mt.remove.ready

##Find object
execute at @s run function modtools:tool/remove/cast/run

##Remove tag
tag @s remove lem.mt.remove.ready
