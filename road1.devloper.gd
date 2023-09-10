extends Area2D
onready var global = get_node("/root/GlobalVars")
onready var textbox = get_node("/root/Textbox/TileMap")
onready var textboxlabel1 = get_node("/root/Textbox/TileMap/VBoxContainer/Label")
onready var textboxlabel2 = get_node("/root/Textbox/TileMap/VBoxContainer/HBoxContainer/Label")
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
		interactNumber = interactNumber + 1
		if interactNumber == 1:
			global.cutscenePlaying = true
			textbox.visible = true
			textboxlabel1.text = "Dev L. Oper:"
			textboxlabel2.text = "This area is"
		if interactNumber == 2:
			global.cutscenePlaying = true
			textbox.visible = true
			textboxlabel1.text = "Dev L. Oper:"
			textboxlabel2.text = "under construction."
		if interactNumber == 3:
			textbox.visible = false
			global.cutscenePlaying = false
			interactNumber = 0


func _on_Area2D_body_entered(body):
	 global.closestInteractable = "devloper"
