##Menu
execute if score #Store 4j.gamestatus matches 0 run function leb-builder:menu/load

##Lobby
execute if score #Store 4j.gamestatus matches 1 run function leb-builder:lobby/relog

##In Game
execute if score #Store 4j.gamestatus matches 2 run function leb-builder:game/death/relog
