extends Node2D
onready var global = get_node("/root/GlobalVars")
onready var data = load("res://creatures.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	print("==[ Elecree v0.0.32 ]==")
	global.cutscenePlaying = true
	print(data.attack_list)

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	# pass

# Will advance to game
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		global.cutscenePlaying = false
		print("Switching to game...")
		get_tree().change_scene("res://rebirthTown.tscn")
