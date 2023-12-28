extends Node2D
onready var global = get_node("/root/GlobalVars")
# var a = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	print("==[ Elecree v0.0.25 ]==")
	global.cutscenePlaying = true
	var test_elecree = Elecree.new(3,3,3,3,3,3,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	# pass

# Will advance to game
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		global.cutscenePlaying = false
		print("Switching to game...")
		get_tree().change_scene("res://rebirthTown.tscn")
