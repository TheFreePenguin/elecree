extends TileMap
onready var global = get_node("/root/GlobalVars")
var menu_number: int = 1


func _ready():
	self.visible = false


func _process(delta):
	if Input.is_action_just_pressed("ui_select") && !global.cutscenePlaying:
		global.cutscenePlaying = true
		self.visible = true
		menu_number = 1
		get_node("VBoxContainer/Label" + String(menu_number)).add_color_override("font_color",Color(1, 1, 1, 1))
	
	if Input.is_action_just_pressed("ui_up") && self.visible:
		get_node("VBoxContainer/Label" + String(menu_number)).add_color_override("font_color",Color(0, 0, 0, 1))
		menu_number -= 1
		if menu_number == 0:
			menu_number = 6
		get_node("VBoxContainer/Label" + String(menu_number)).add_color_override("font_color",Color(1, 1, 1, 1))
	
	if Input.is_action_just_pressed("ui_down") && self.visible:
		get_node("VBoxContainer/Label" + String(menu_number)).add_color_override("font_color",Color(0, 0, 0, 1))
		menu_number += 1
		if menu_number == 7:
			menu_number = 1
		get_node("VBoxContainer/Label" + String(menu_number)).add_color_override("font_color",Color(1, 1, 1, 1))
		
	if Input.is_action_just_pressed("ui_accept"):
		match menu_number:
			1:
				pass
			2:
				pass
			3:
				pass
			4:
				pass
			5:
				pass
			6:
				self.visible = false
				global.cutscenePlaying = false
				menu_number = 7
				get_node("VBoxContainer/Label" + String(6)).add_color_override("font_color",Color(0, 0, 0, 1))
			7:
				pass
