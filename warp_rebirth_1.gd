extends Node


onready var global = get_node("/root/GlobalVars")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initialized warp_rebirth_1.gd")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_Area2D_body_entered(body):
	print("Warping the player to Road 1...")
	global.currentPos = get_parent().get_node("Player").global_position
	global.posMod.x = -688
	global.posMod.y = 64
	global.currentScene = "rebirthTown"
	#global.destinationScene = "road1"
	global._warpPlayer(Vector2((get_node("../Player").global_position.x) - 688, (get_node("../Player").global_position.y) + 64), "road1")
