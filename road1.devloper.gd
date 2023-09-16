extends Area2D
onready var global = get_node("/root/GlobalVars")
onready var textbox = get_node("/root/Textbox/TileMap")
onready var textboxlabel1 = get_node("/root/Textbox/TileMap/VBoxContainer/Label")
onready var textboxlabel2 = get_node("/root/Textbox/TileMap/VBoxContainer/HBoxContainer/Label")
onready var textboxlabel3 = get_node("/root/Textbox/TileMap/VBoxContainer/HBoxContainer2/Label")
var interactNumber: int

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	interactNumber = 0
	print("Initialized road1.devloper.gd")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if global.closestInteractable == "devloper":
			interactNumber = interactNumber + 1
			if interactNumber == 1:
				global.cutscenePlaying = true
				textbox.visible = true
				textboxlabel1.text = "Dev L. Oper:"
				textboxlabel2.text = "This area is under"
				textboxlabel3.text = "construction."
			if interactNumber == 2:
				textbox.visible = false
				global.cutscenePlaying = false
				interactNumber = 0
	if Input.is_action_just_pressed("ui_cancel"):
		print("Closest Interactable:" + global.closestInteractable)
		



func _on_Area2D_body_entered(body):
	print(body)
	if body.name == "Player":
		global.closestInteractable = "devloper"
	
func _on_Area2D_body_exited(body):
	global.closestInteractable = "null"
