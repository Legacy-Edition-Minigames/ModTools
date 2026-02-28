##Display message
#Missing resource pack
tellraw @s ["",{"translate":"lem.mt.dontuse","fallback":"WARNING: ","bold":true,"color":"red"},{"translate":"lem.mt.dontuse","fallback":"You don't have the ModTools resource pack loaded!\n","color":"red"},{"translate":"lem.mt.dontuse","fallback":"This pack is necessary to use the editor!!!\n","bold":true,"color":"dark_red"},{"translate":"lem.mt.dontuse","fallback":"Click here to download the pack!","color":"blue","clickEvent":{"action":"open_url","value":"https://docs.legacyminigames.net/en/latest/modtools/creation/install-resources.html"},"hoverEvent":{"action":"show_text","contents":[{"text":"https://docs.legacyminigames.net/en/latest/modtools/creation/install-resources.html","color":"blue"}]}}]
#Discord
#tellraw @s ["",{"text":"Come join the Community Server to talk about LEB, ask for help, find groups to play with and see development updates!","color":"#7289DA"},"\n",{"text":"https://discord.gg/mqpf93ZTgM","underlined":true,"color":"blue","clickEvent":{"action":"open_url","value":"https://discord.gg/mqpf93ZTgM"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to open: https://discord.gg/mqpf93ZTgM","color":"blue"}]}}]
#ModTools
tellraw @s ["",{"translate":"lem.mt.welcome","fallback":"","color":"green"},{"text":"\n"},{"translate":"lem.mt.readdocs","fallback":"","with":[{"translate":"lem.mt.readdocs.link","fallback":"","color":"blue","clickEvent":{"action":"open_url","value":"https://docs.legacyminigames.net/en/latest/modtools/landing.html"},"hoverEvent":{"action":"show_text","contents":[{"text":"https://docs.legacyminigames.net/en/latest/modtools/landing.html","color":"blue"}]}}],"color":"gold"}]
#minecraftjson.com export: {"jformat":8,"jobject":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"green","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_children":[],"translate":"lem.mt.welcome","parameters":[]},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_children":[],"text":"\n"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"gold","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_children":[],"translate":"lem.mt.readdocs","parameters":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"blue","insertion":"","click_event_type":"open_url","click_event_value":"https://docs.legacyminigames.net/en/latest/modtools/landing.html","hover_event_type":"show_text","hover_event_value":"","hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"blue","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_children":[],"text":"https://docs.legacyminigames.net/en/latest/modtools/landing.html"}],"translate":"lem.mt.readdocs.link","parameters":[]}]}],"command":"tellraw @s %s","jtemplate":"tellraw"}
title @s title {"translate":"lem.mt.dontuse","fallback":"WARNING!!!","bold":true,"underlined":true,"color":"dark_red"}
title @s subtitle {"translate":"lem.mt.dontuse","fallback":"Resources not installed!","bold":true,"color":"red"}

##Set title times
title @s times 5t 10s 5t

##Remove tags
tag @s remove lem.mt.remove.held

##Set player ID
execute as @s unless score @s lem.mt.pid matches 1.. store result score @s lem.mt.pid run scoreboard players add #Store lem.mt.pid 1

##Give items
function modtools:give/check

##Check for invalid borders
function modtools:spawn/border/check
