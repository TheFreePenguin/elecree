extends TileMap
onready var global = get_node("/root/GlobalVars")
var textbox: Node
var menu_number: int = 1
var in_save: bool = false
var leaving_save: bool = false


func _ready():
	textbox = get_node("/root/Textbox/TextBox")
	self.visible = false
	print("Name: " + self.name)


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
		if in_save:
			leaving_save = true
			in_save = false
		match menu_number:
			1:
				pass
			2:
				self.visible = false
				TeamScreen.reboot()
				TeamScreen.show_items()
				menu_number = 7
				get_node("VBoxContainer/Label" + String(2)).add_color_override("font_color",Color(0, 0, 0, 1))
			3:
				self.visible = false
				bag.visible = true
				bag.offset = 0
				bag.select = 0
				bag.refresh()
				menu_number = 7
				get_node("VBoxContainer/Label" + String(3)).add_color_override("font_color",Color(0, 0, 0, 1))
			4:
				self.visible = false
				Battlercard.get_node("CanvasLayer").visible = true
				Battlercard.get_node("CanvasLayer/TileMap").visible = true
				menu_number = 7
				get_node("VBoxContainer/Label" + String(4)).add_color_override("font_color",Color(0, 0, 0, 1))
			5:
				self.visible = false
				menu_number = 7
				yield(get_tree(), "idle_frame")
				Yesno.get_node("CanvasLayer/QuestionLabel").ask_question("Will you save the game?")
				var result: bool = yield(Yesno.get_node("CanvasLayer/QuestionLabel"), "answer")
				print("Signal Received")
				get_node("VBoxContainer/Label" + String(5)).add_color_override("font_color",Color(0, 0, 0, 1))
				if result:
					var save: String = to_json(GlobalVars.serialize_save())
					print(save)
					var save_file: File = File.new()
					print("Could open?")
					print(save_file.open("user://savefile.dat", 7))
					#print("Is open?" + str(save_file.is_open()))
					save_file.store_string(save)
					textbox.visible = true
					textbox.get_node("VBoxContainer/Label").text = "Save successful!"
					in_save = true
					while !leaving_save:
					#	print("Looping until leaving save")
						yield(get_tree(), "idle_frame")
					leaving_save = false
					textbox.get_node("VBoxContainer/Label").text = ""
					textbox.visible = false
				GlobalVars.cutscenePlaying = false
			6:
				self.visible = false
				global.cutscenePlaying = false
				menu_number = 7
				get_node("VBoxContainer/Label" + String(6)).add_color_override("font_color",Color(0, 0, 0, 1))
			7:
				pass
