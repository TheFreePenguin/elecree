extends Label

var response: bool = true
signal answer(yes_or_no)

func _ready():
	get_parent().visible = false
	get_parent().get_node("TileMap").visible = false
	get_parent().get_node("YesLabel").add_color_override("font_color", Color(1,1,1))
	get_parent().get_node("NoLabel").add_color_override("font_color", Color(0,0,0))

func ask_question(question: String):
	get_parent().visible = true
	get_parent().get_node("TileMap").visible = true
	text = question

func _process(delta: float):
	if get_parent().visible:
		#print("Yesno visible")
		if Input.is_action_just_pressed("ui_left"):
			response = true
			get_parent().get_node("YesLabel").add_color_override("font_color", Color(1,1,1))
			get_parent().get_node("NoLabel").add_color_override("font_color", Color(0,0,0))
		if Input.is_action_just_pressed("ui_right"):
			response = false
			get_parent().get_node("NoLabel").add_color_override("font_color", Color(1,1,1))
			get_parent().get_node("YesLabel").add_color_override("font_color", Color(0,0,0))
		if Input.is_action_just_pressed("ui_accept"):
			print("Z pressed in question")
			yield(get_tree(), "idle_frame")
			get_parent().visible = false
			_ready()
			emit_signal("answer", response)
			response = true
