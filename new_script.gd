extends Node2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("==[ Elecree v0.0.17 ]==")


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	# pass

# Will advance to game
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		print("Switching to game...")
		get_tree().change_scene("res://rebirthTown.tscn")
