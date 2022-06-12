extends Area2D

onready var global = get_node("/root/GlobalVars")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initialized warpRebirthToHouse1.gd")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D2_body_entered(body):
	print("Warping the player to Rebirth House 1...")
	global.currentPos = get_parent().get_node("Player").global_position
	global.currentScene = "rebirthTown"
	global.destinationScene = "rebirthHouse1"
	global._warpPlayer()
