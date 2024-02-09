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
	
	if lock == 0 && !flavortext:
		player.recharge += player.currentsp * delta
		player.recharge = 100 if player.recharge > 100 else player.recharge
		opponent.recharge += opponent.currentsp * delta
		opponent.recharge = 100 if opponent.recharge > 100 else opponent.recharge
	
	if lock == 1 && Input.is_action_just_pressed("ui_accept"):
		lock = 2
		get_node("Attack Selector").wait_and_show()
	
	#if lock == 2:
	
	
	if get_node("PlayerElecree").data.currentst < 0:
		get_node("PlayerElecree").data.currenthp += get_node("PlayerElecree").data.currentst
		get_node("PlayerElecree").data.currentst = 0
	
	if get_node("OpposingElecree").data.currentst < 0:
		get_node("OpposingElecree").data.currenthp += get_node("OpposingElecree").data.currentst
		get_node("OpposingElecree").data.currentst = 0
	
	if player.currenthp <= 0 && !flavortext:
		yield(display_text([player.get_name() + " is defeated!"]), "completed")
		player.recharge = 0
		player.heal()
		global.cutscenePlaying = false
		#team.team[0] = player.duplicate(true)
		global._warpPlayer(Vector2(64, 88), global.last_e_center)
	
#	if opponent.currenthp <= 0 && !flavortext:
#		player.recharge = 0
#		#team.team[0] = player.duplicate()
#		print(team.team[0].currenthp)
#		global.cutscenePlaying = false
#		global._warpPlayer(global.last_pos, global.last_loc)
	
	if [0, 1].has(lock):
		if player.recharge >= 100:
			if player.status != 3:
				lock = 1
			else:
				player.status = 0
				player.recharge = 0
				player.currentdf /= 1.5
		elif opponent.recharge >= 100:
			if opponent.status != 3:
				lock = -1
				var attack = get_node("OpposingElecree").enemy_ai()
				yield(get_node("OpposingElecree").attack(get_node("PlayerElecree").data, attack), "completed")
				lock = 0
			else:
				opponent.status = 0
				opponent.recharge = 0
				opponent.currentdf /= 1.5
	
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
		3:
			get_node("CanvasLayer/OpponentInfoBox/Status").text = "Defend"
	get_node("CanvasLayer/OpponentInfoBox/Recharge").text = str(int(opponent.recharge))
	get_node("CanvasLayer/OpponentHPBox/HP").text = "H: " + str(opponent.currenthp)
	get_node("CanvasLayer/OpponentHPBox/SP").text = "S: " + str(opponent.currentst)
	
	if !flavortext:
		get_node("CanvasLayer/InfoBox/HBoxContainer/Name").text = dict[player.species].name
		get_node("CanvasLayer/InfoBox/HBoxContainer/Level").text = ":L" + str(player.level)
		match player.status:
			0:
				get_node("CanvasLayer/InfoBox/HBoxContainer/Status").text = "OK"
			1:
				get_node("CanvasLayer/InfoBox/HBoxContainer/Status").text = "Burn"
			2:
				get_node("CanvasLayer/InfoBox/HBoxContainer/Status").text = "Poison"
			3:
				get_node("CanvasLayer/InfoBox/HBoxContainer/Status").text = "Defend"
		get_node("CanvasLayer/InfoBox/HBoxContainer/Recharge").text = str(int(player.recharge))
		get_node("CanvasLayer/PlayerHPBox/HP").text = "H: " + str(player.currenthp)
		get_node("CanvasLayer/PlayerHPBox/SP").text = "S: " + str(player.currentst)

func refresh_creatures():
	player = $PlayerElecree.data
	opponent = $OpposingElecree.data


func display_text(text: Array):
	print("text should be displaying" + text[0])
	flavortext = true
	get_node("CanvasLayer/InfoBox/HBoxContainer").hide()
	get_node("CanvasLayer/InfoBox/FullBox").show()
	for x in text:
		if x != "":
			get_node("CanvasLayer/InfoBox/FullBox").text = x
			yield(get_tree(), "idle_frame")
			yield(self, "z_press")
	get_node("CanvasLayer/InfoBox/FullBox").hide()
	get_node("CanvasLayer/InfoBox/HBoxContainer").show()
	flavortext = false

func win_battle():
	player.recharge = 0
	#team.team[0] = player.duplicate()
	#print(team.team[0].currenthp)
	global.cutscenePlaying = false
	global._warpPlayer(global.last_pos, global.last_loc)
