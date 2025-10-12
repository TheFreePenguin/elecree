extends Node2D
class_name CreatureSelector

var creature: int
var labels: Array
var creatures: int
var dictionaries: Dictionary
var team_of_creatures: Array
var in_details: bool = false
var first_frame: bool = true

	

func hide_items():
	get_node("CanvasLayer").hide()
	get_node("CanvasLayer/TileMap").hide()


func show_items():
	get_node("CanvasLayer").show()
	get_node("CanvasLayer/TileMap").show()

func _ready():
	get_node("CanvasLayer").connect("visibility_changed", self, "on_hide")
	reboot()

func on_hide():
	if !get_node("CanvasLayer").visible:
		print("On hide")
		first_frame = true

func reboot():
	hide_items()
	labels = [get_node("CanvasLayer/VBoxContainer/Label"), get_node("CanvasLayer/VBoxContainer/Label2"), get_node("CanvasLayer/VBoxContainer/Label3"), get_node("CanvasLayer/VBoxContainer/Label4"), get_node("CanvasLayer/VBoxContainer/Label5"), get_node("CanvasLayer/VBoxContainer/Label6"), get_node("CanvasLayer/VBoxContainer/Label7")]
	dictionaries = load("res://creatures.tres").data
	set_texts(team.team)
	creatures = get_length_of_creature_list(get_texts(labels))

func better_modulus(value: int, modulus: int) -> int:
	return (value % modulus) if value >= 0 || modulus == 1 else (value % modulus) + modulus

func set_texts(array: Array):
	print(labels.size())
	for creature in array.size():
		if array[creature] == null:
			labels[creature].text = ""
		else:
			labels[creature].text = get_name_of_creature(array[creature])

func get_texts(array: Array) -> Array:
	var ret: Array = []
	for s in array:
		ret.push_back(s.text)
	return ret

func get_length_of_creature_list(array: Array) -> int:
	var num: int = 0
	for s in array:
		if s != "":
			num += 1
	return num

func get_names_of_creatures(array: Array) -> Array: # deprecated
	var arr: Array = []
	for e in array:
		var text: String = ""
		text += dictionaries[e.species].name
		text += " :L"
		text += str(e.level)
		arr.push_back(text)
	return arr
	
func get_name_of_creature(elecree: Elecree) -> String:
	var text: String = ""
	text += dictionaries[elecree.species].name
	text += " :L"
	text += str(elecree.level)
	return text
	

func size_without_nulls(arr: Array) -> int:
	var i: int = 0
	for a in arr:
		if a != null:
			i += 1
	return i

func _process(delta: float):
	if get_node("CanvasLayer").visible && !in_details && !first_frame:
		if Input.is_action_just_pressed("ui_down"):
			creature += 1
			creature = better_modulus(creature, size_without_nulls(team.team))
		if Input.is_action_just_pressed("ui_up"):
			creature -= 1
			creature = better_modulus(creature, size_without_nulls(team.team))
		if Input.is_action_just_pressed("ui_cancel"):
			hide_items()
			GlobalVars.cutscenePlaying = false
			first_frame = true
		if Input.is_action_just_pressed("ui_accept"):
			in_details = true
			var cdetails := get_node("CanvasLayer/CreatureDetails")
			cdetails.show()
			#print("first frame is " + str(first_frame))
			cdetails.creature = creature
			cdetails.creature_changed()
			#print(str(creature) + ", " + str(cdetails.creature))
	if get_node("CanvasLayer").visible:
		first_frame = false
	
	for l in labels.size():
		if l == creature:
			labels[l].add_color_override("font_color", Color(1, 1, 1))
		else:
			labels[l].add_color_override("font_color", Color(0, 0, 0))
