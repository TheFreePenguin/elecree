extends Node

export var destination: String
export var coord: Vector2
export var relative: bool

onready var global = get_node("/root/GlobalVars")


# Called when the node enters the scene tree for the first time.
func _ready():
	print()





func _on_Area2D_body_entered(body):
	print("Warping...")
	global._warpPlayer(coord, destination, relative)
