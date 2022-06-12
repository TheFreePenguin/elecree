extends Node
onready var global = get_node("/root/GlobalVars")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Correcting player position...")
	if global.currentScene == "rebirthTown":
		get_node("Player/Sprite").global_position = get_node("Player").global_position
		get_node("Player/CollisionShape2D").global_position = get_node("Player").global_position
		get_node("Player").global_position.x = 64
		get_node("Player").global_position.y = 88


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
