##Summon AEC
execute align y run summon area_effect_cloud ~ ~0.5 ~ {Duration:2147483647,Tags:["lem.mapentity","lem.mt.needid","PowerfulChest","Chest"]}

##Set ID
execute as @e[tag=lem.mt.needid] run function modtools:spawn/id

##Display icon
function modtools:spawn/chest/icon/powerful

##Display warning
execute store result score #lem.mt.store lem.mt.temp if entity @e[type=area_effect_cloud,tag=PowerfulChest]
execute if score #lem.mt.store lem.mt.temp matches 5.. run tellraw @a ["",{"translate":"lem.mt.toomanypower.warning","bold":true,"color":"dark_red"},{"text":" "},{"translate":"lem.mt.toomanypower","color":"red"},{"text":"\n"},{"translate":"lem.mt.toomanypower.link","color":"blue","clickEvent":{"action":"open_url","value":"https://example.com"},"hoverEvent":{"action":"show_text","contents":[{"text":"https://example.com","color":"blue"}]}}]
#minecraftjson.com export: {"jformat":8,"jobject":[{"bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"dark_red","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_children":[],"translate":"lem.mt.toomanypower.warning","parameters":[]},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_children":[],"text":" "},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"red","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_children":[],"translate":"lem.mt.toomanypower","parameters":[]},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"none","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_children":[],"text":"\n"},{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"blue","insertion":"","click_event_type":"open_url","click_event_value":"https://example.com","hover_event_type":"show_text","hover_event_value":"","hover_event_children":[{"bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"font":null,"color":"blue","insertion":"","click_event_type":"none","click_event_value":"","hover_event_type":"none","hover_event_value":"","hover_event_children":[],"text":"https://example.com"}],"translate":"lem.mt.toomanypower.link","parameters":[]}],"command":"tellraw @a %s","jtemplate":"tellraw"}

##Run global functions
function modtools:spawn/chest/global

##Remove spawning entity
kill @s
