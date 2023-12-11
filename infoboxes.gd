extends Node2D

onready var dict = load("res://creatures.tres").data
#onready var player = $PlayerElecree.data
onready var opponent = $OpposingElecree.data

func _ready():
	print($OpposingElecree.data)

func _process(delta):
	get_node("CanvasLayer/OpponentInfoBox/Name").text = dict[opponent.species].name
	get_node("CanvasLayer/OpponentInfoBox/Level").text = ":L" + str(opponent.level)
	match opponent.status:
		0:
			get_node("CanvasLayer/OpponentInfoBox/Status").text = "OK"
		1:
			get_node("CanvasLayer/OpponentInfoBox/Status").text = "Burn"
		2:
			get_node("CanvasLayer/OpponentInfoBox/Status").text = "Poison"
	get_node("CanvasLayer/OpponentInfoBox/Recharge").text = str(opponent.recharge)
	get_node("CanvasLayer/OpponentHPBox/HP").text = "H: " + str(opponent.currenthp)
	get_node("CanvasLayer/OpponentHPBox/SP").text = "S: " + str(opponent.currentst)
