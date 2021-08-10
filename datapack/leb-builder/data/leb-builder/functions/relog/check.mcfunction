##Setup users on a relog
#New users
execute as @a[tag=!relog] run function leb-builder:relog/setup/new
#Existing users
execute as @a[scores={4j.relog=1..}] run function leb-builder:relog/setup/existing

##Run again in 10 ticks
schedule function leb-builder:relog/check 5t
