extends Node2D

var item_bag: Array = ["Capture Cube", "Super Capture Cube", "Capture Cube", "Super Capture Cube", "Super Capture Cube"]
var bag_ui: Array
var offset: int
var select: int
var precolor: String

func generate_bag_ui() -> Array:
	var items: Array
	var amounts: Array
	var ui: Array
	for s in item_bag:
		if items.has(s):
			amounts[items.find(s)] += 1
		else:
			items.push_back(s)
			amounts.push_back(1)
	for i in items.size():
		ui.push_back(items[i] + " x" + str(amounts[i]))
	return ui

func return_string_or_blank(array: Array, position: int) -> String:
	if array[position] is String && position >= 0 && position < array.size():
		return array[position]
	else:
		return ""

func get_nine_items(from: Array) -> String:
	var output: String = ""
	for i in from.size():
		if i < offset:
			continue
		output += str(from[i])
		if i - offset >= 8:
			break
		if i != from.size() - 1:
			output += "\n"
	return output

func _ready():
	refresh()

func refresh():
	bag_ui = generate_bag_ui()
	precolor = get_nine_items(bag_ui)
	get_node("CanvasLayer/RichTextLabel").bbcode_text = color_selection()

func color_selection() -> String:
	var splitted_string: Array = precolor.split("\n")
	splitted_string[select] = "[color=white]" + splitted_string[select] + "[/color]"
	var postcolor: String = "\n".join(splitted_string)
	return postcolor
	
func _process(delta: float):
	get_node("CanvasLayer").visible = visible
	if visible:
		if Input.is_action_just_pressed("ui_down") && select + offset < bag_ui.size() - 1:
			if select >= 8:
				offset += 1
			else:
				select += 1
			refresh()
			print("New select: " + str(select + offset))
		if Input.is_action_just_pressed("ui_up") && select + offset >= 1:
			if select <= 0:
				offset -= 1
			else:
				select -= 1
			refresh()
			print("New select: " + str(select + offset))
		if Input.is_action_just_pressed("ui_cancel"):
			visible = false
			GlobalVars.cutscenePlaying = false
