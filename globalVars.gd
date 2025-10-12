extends Node
var currentScene: String
#var destinationScene: String
var posMod: Vector2
var currentPos: Vector2
var cutscenePlaying: bool
var closestInteractable: String = "null"
var devCode: int = 0
var devMode: bool = false
var last_e_center: String = "rebirthECenter"
var last_pos: Vector2
var last_loc: String
var wildgen: Array
var wild: bool
var e_device_caught: Array = []
var real_time: float = 0
var time: String
var credits: int = 300
var player_name: String = "Fire" # Default player name, will be changeable in release

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initialized globalVars.gd")
	cutscenePlaying = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func serialize_save() -> Dictionary:
	var output: Dictionary = {}
	output["current_scene"] = get_tree().current_scene.get_path()
	output["dev_mode"] = devMode
	output["last_e_center"] = last_e_center
	output["caught_creatures"] = e_device_caught
	output["real_time"] = real_time
	output["credits"] = credits
	output["player_name"] = player_name
	output["x_position"] = get_node(String(get_tree().current_scene.get_path()) + "/Player").global_position.x
	output["y_position"] = get_node(String(get_tree().current_scene.get_path()) + "/Player").global_position.y
	return output

func _warpPlayer(destination: Vector2, destination_scene: String, relative: bool = false):
	if relative:
		destination += get_node(String(get_tree().current_scene.get_path()) + "/Player").global_position
	if destination_scene.begins_with("res://"): 
		get_tree().change_scene(destination_scene)
	else:
		get_tree().change_scene("res://" + destination_scene + ".tscn")
	yield(get_tree(), "idle_frame")
	get_node(String(get_tree().current_scene.get_path()) + "/Player").global_position = destination
	get_node(String(get_tree().current_scene.get_path()) + "/Player/Sprite").global_position = get_node(String(get_tree().current_scene.get_path()) + "/Player").global_position
	get_node(String(get_tree().current_scene.get_path()) + "/Player/CollisionShape2D").global_position = get_node(String(get_tree().current_scene.get_path()) + "/Player").global_position
	

func start_wild_battle(hp: int, at: int, df: int, sp: int, st: int, lv: int, id: int, lastPos: Vector2, lastLoc: String):
	cutscenePlaying = true
	last_pos = lastPos
	last_loc = lastLoc
	get_tree().change_scene("res://battle.tscn")
	wild = true
	wildgen = [hp, at, df, sp, st, lv, id]


func leading_zero(input: String) -> String:
	if input.length() == 1:
		return "0" + input
	else:
		return input

func _process(delta):
	
	real_time += delta
	var seconds: int = int(real_time)
	time = str(seconds / 60) + ":" + leading_zero(str(seconds % 60))
	
	
	if Input.is_key_pressed(KEY_B):
		print("Bag is open: " + String(bag.visible))
	
	if Input.is_action_just_pressed("ui_up") && (devCode == 0 || devCode == 1):
		devCode += 1
	elif Input.is_action_just_pressed("ui_down"):
		if (devCode == 2 || devCode == 3):
			devCode += 1
		else:
			devCode = 0
	elif Input.is_action_just_pressed("ui_left"):
		if (devCode == 4 || devCode == 6):
			devCode += 1
		else:
			devCode = 0
	elif Input.is_action_just_pressed("ui_right"):
		if (devCode == 5 || devCode == 7):
			devCode += 1
		else:
			devCode = 0
	elif Input.is_action_just_pressed("ui_cancel"):
		if (devCode == 8):
			devCode += 1
		else:
			devCode = 0
	elif Input.is_action_just_pressed("ui_accept"):
		if (devCode == 9):
			devCode += 1
			devMode = !devMode
			print("Developer mode set to " + str(devMode)) 
		devCode = 0
