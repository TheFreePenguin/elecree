extends CanvasLayer

var page: int = 0

func _ready():
	self.visible = false

func get_attack(pg: int, number: int) -> String:
	var order: int = (pg * 3) + number
	if get_parent().get_node("PlayerElecree").data.attacks.size() < order:
		return ""
	else:
		return get_parent().get_node("PlayerElecree").data.attacks[order - 1]

func _process(delta):
	get_node("VBoxContainer/Attack1").text = get_attack(page, 1)
	get_node("VBoxContainer/Attack2").text = get_attack(page, 2)
	get_node("VBoxContainer/Attack3").text = get_attack(page, 3)
