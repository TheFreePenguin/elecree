extends Node
onready var global = get_node("/root/GlobalVars")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Correcting player position...")
	get_node("Player").global_position = global.currentPos + global.posMod


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
