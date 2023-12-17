extends Node2D

var lock: bool = false
onready var dict = load("res://creatures.tres").data
onready var player = $PlayerElecree.data
onready var opponent = $OpposingElecree.data

func _ready():
	print($OpposingElecree.data)

func _process(delta):
	if !lock:
		player.recharge += player.currentsp / 144.00
		player.recharge = 100 if player.recharge > 100 else player.recharge
		opponent.recharge += opponent.currentsp / 144.00
		opponent.recharge = 100 if opponent.recharge > 100 else opponent.recharge
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
