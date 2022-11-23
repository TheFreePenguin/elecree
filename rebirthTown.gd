extends Node
onready var global = get_node("/root/GlobalVars")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Correcting player position...")
	get_node("Player/Sprite").global_position = get_node("Player").global_position
	get_node("Player/CollisionShape2D").global_position = get_node("Player").global_position
	if global.currentScene == "road1":
		get_node("Player").global_position = global.currentPos + global.posMod
	if global.currentScene == "rebirthHouse1":
		get_node("Player/Sprite").global_position = get_node("Player").global_position
		get_node("Player/CollisionShape2D").global_position = get_node("Player").global_position
		get_node("Player").global_position.x = 104
		get_node("Player").global_position.y = 80
	if global.currentScene == "rebirthHouse2":
		get_node("Player/Sprite").global_position = get_node("Player").global_position
		get_node("Player/CollisionShape2D").global_position = get_node("Player").global_position
		get_node("Player").global_position.x = 232
		get_node("Player").global_position.y = 80
	if global.currentScene == "rebirthHouse3":
		get_node("Player/Sprite").global_position = get_node("Player").global_position
		get_node("Player/CollisionShape2D").global_position = get_node("Player").global_position
		get_node("Player").global_position.x = 104
		get_node("Player").global_position.y = 240
	if global.currentScene == "rebirthHouse4":
		get_node("Player/Sprite").global_position = get_node("Player").global_position
		get_node("Player/CollisionShape2D").global_position = get_node("Player").global_position
		get_node("Player").global_position.x = 232
		get_node("Player").global_position.y = 240
	if global.currentScene == "rebirthECenter":
		get_node("Player/Sprite").global_position = get_node("Player").global_position
		get_node("Player/CollisionShape2D").global_position = get_node("Player").global_position
		get_node("Player").global_position.x = 104
		get_node("Player").global_position.y = 408

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
