extends Node2D

signal z_press()
var lock: int = 0
var flavortext: bool = false
onready var team = get_node("/root/team")
onready var global = get_node("/root/GlobalVars")
onready var dict = load("res://creatures.tres").data
onready var player = $PlayerElecree.data
onready var opponent = $OpposingElecree.data


func _ready():
	print($OpposingElecree.data)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("z_press")
	
	if player.currenthp <= 0:
		player.heal()
		#team.team[0] = player.duplicate(true)
		global._warpPlayer(Vector2(64, 88), global.last_e_center)
	
	if opponent.currenthp <= 0:
		#team.team[0] = player.duplicate()
		print(team.team[0].currenthp)
		global._warpPlayer(global.last_pos, global.last_loc)
	
	
	if lock == 0:
		player.recharge += player.currentsp / 144.00
		player.recharge = 100 if player.recharge > 100 else player.recharge
		opponent.recharge += opponent.currentsp / 144.00
		opponent.recharge = 100 if opponent.recharge > 100 else opponent.recharge
	
	if lock == 1 && Input.is_action_just_pressed("ui_accept"):
		lock = 2
		get_node("Attack Selector").wait_and_show()
	
	#if lock == 2:
		
	
	if [-1, 0, 1].has(lock):
		if player.recharge >= 100:
			lock = 1
		elif opponent.recharge >= 100:
			lock = -1
			get_node("OpposingElecree").data.attack(get_node("PlayerElecree").data, get_node("OpposingElecree").enemy_ai())
			lock = 0
	
	if lock == 1:
		get_node("CanvasLayer/InfoBox/HBoxContainer/Name").add_color_override("font_color", Color(1.0, 1.0, 1.0))
		get_node("CanvasLayer/InfoBox/HBoxContainer/Level").add_color_override("font_color", Color(1.0, 1.0, 1.0))
		get_node("CanvasLayer/InfoBox/HBoxContainer/Status").add_color_override("font_color", Color(1.0, 1.0, 1.0))
		get_node("CanvasLayer/InfoBox/HBoxContainer/Recharge").add_color_override("font_color", Color(1.0, 1.0, 1.0))
	else:
		get_node("CanvasLayer/InfoBox/HBoxContainer/Name").add_color_override("font_color", Color(0.0, 0.0, 0.0))
		get_node("CanvasLayer/InfoBox/HBoxContainer/Level").add_color_override("font_color", Color(0.0, 0.0, 0.0))
		get_node("CanvasLayer/InfoBox/HBoxContainer/Status").add_color_override("font_color", Color(0.0, 0.0, 0.0))
		get_node("CanvasLayer/InfoBox/HBoxContainer/Recharge").add_color_override("font_color", Color(0.0, 0.0, 0.0))
	
	get_node("CanvasLayer/OpponentInfoBox/Name").text = dict[opponent.species].name
	get_node("CanvasLayer/OpponentInfoBox/Level").text = ":L" + str(opponent.level)
	match opponent.status:
		0:
			get_node("CanvasLayer/OpponentInfoBox/Status").text = "OK"
		1:
			get_node("CanvasLayer/OpponentInfoBox/Status").text = "Burn"
		2:
			get_node("CanvasLayer/OpponentInfoBox/Status").text = "Poison"
	get_node("CanvasLayer/OpponentInfoBox/Recharge").text = str(int(opponent.recharge))
	get_node("CanvasLayer/OpponentHPBox/HP").text = "H: " + str(opponent.currenthp)
	get_node("CanvasLayer/OpponentHPBox/SP").text = "S: " + str(opponent.currentst)
	
	if !flavortext || flavortext:
		get_node("CanvasLayer/InfoBox/HBoxContainer/Name").text = dict[player.species].name
		get_node("CanvasLayer/InfoBox/HBoxContainer/Level").text = ":L" + str(player.level)
		match player.status:
			0:
				get_node("CanvasLayer/InfoBox/HBoxContainer/Status").text = "OK"
			1:
				get_node("CanvasLayer/InfoBox/HBoxContainer/Status").text = "Burn"
			2:
				get_node("CanvasLayer/InfoBox/HBoxContainer/Status").text = "Poison"
		get_node("CanvasLayer/InfoBox/HBoxContainer/Recharge").text = str(int(player.recharge))
		get_node("CanvasLayer/PlayerHPBox/HP").text = "H: " + str(player.currenthp)
		get_node("CanvasLayer/PlayerHPBox/SP").text = "S: " + str(player.currentst)

func display_text(text: Array):
	flavortext = true
	get_node("CanvasLayer/InfoBox/HBoxContainer/Level").text = ""
	get_node("CanvasLayer/InfoBox/HBoxContainer/Status").text = ""
	get_node("CanvasLayer/InfoBox/HBoxContainer/Recharge").text = ""
	for x in text:
		get_node("CanvasLayer/InfoBox/HBoxContainer/Name").text = x
		yield(self, "z_press")
	flavortext = false
