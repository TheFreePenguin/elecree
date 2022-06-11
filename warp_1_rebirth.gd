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
	print("Warping " + body.name + " to Rebirth Town...")
	global.currentPos = get_parent().get_node("Player").global_position
	global.posMod.x = 688
	global.posMod.y = -64
	global.destinationScene = "rebirthTown"
	global._warpPlayer()
