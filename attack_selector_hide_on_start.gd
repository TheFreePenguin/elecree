extends CanvasLayer

var page: int = 0

var select: int = 1

func _ready():
	self.visible = false

func get_attack(pg: int, number: int) -> String:
	var order: int = (pg * 3) + number
	if order <= 0:
		return ""
	else:
		if get_parent().get_node("PlayerElecree").data.attacks.size() < order:
			return ""
		else:
			return get_parent().get_node("PlayerElecree").data.attacks[order - 1]

func get_attack_and_stamina(pg: int, number: int) -> String:
	var attack = get_attack(pg, number)
	if attack != "":
		return attack + " (" + str(get_parent().get_node("PlayerElecree").data.get_stamina(attack)) + ")"
	else:
		return ""

func _process(delta):
	get_node("VBoxContainer/Attack1").text = get_attack_and_stamina(page, 1)
	get_node("VBoxContainer/Attack2").text = get_attack_and_stamina(page, 2)
	get_node("VBoxContainer/Attack3").text = get_attack_and_stamina(page, 3)
	
	if self.visible && Input.is_action_just_pressed("ui_down"):
		select += 1 if get_attack(page, select + 1) != "" else 0
	
	if self.visible && Input.is_action_just_pressed("ui_up"):
		select -= 1 if get_attack(page, select - 1) != "" else 0
	
	if self.visible && Input.is_action_just_pressed("ui_accept"):
		self.visible = false
		yield(get_parent().display_text([get_parent().get_node("PlayerElecree").data.get_name() + " used " + get_attack(page, select) + " !"]), "completed")
		get_parent().get_node("PlayerElecree").data.attack(get_parent().get_node("OpposingElecree").data, get_attack(page, select))
		#get_node("TileMap").visible = false
		get_parent().lock = 0
	
	
	if select == 4:
		page += 1
		select = 1
	
	if select == 0:
		page -= 1
		select = 3
	
	get_node("VBoxContainer/Attack1").add_color_override("font_color", Color(1, 1, 1) if select == 1 else Color(0, 0, 0))
	get_node("VBoxContainer/Attack2").add_color_override("font_color", Color(1, 1, 1) if select == 2 else Color(0, 0, 0))
	get_node("VBoxContainer/Attack3").add_color_override("font_color", Color(1, 1, 1) if select == 3 else Color(0, 0, 0))

func wait_and_show():
	yield(get_tree(), "idle_frame")
	visible = true
