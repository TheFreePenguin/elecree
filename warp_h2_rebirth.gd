extends Area2D

onready var global = get_node("/root/GlobalVars")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initialized warp_h2_rebirth.gd")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	print("Warping the player to Rebirth Town...")
	global._warpPlayer(Vector2(232, 80), "rebirthTown")


