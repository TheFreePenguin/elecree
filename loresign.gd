extends Area2D
var interactNumber: int
onready var global = get_node("/root/GlobalVars")
onready var textbox = get_node("/root/Textbox/TextBox")
onready var textboxlabel1 = get_node("/root/Textbox/TextBox/VBoxContainer/Label")
onready var textboxlabel2 = get_node("/root/Textbox/TextBox/VBoxContainer/HBoxContainer/Label")
onready var textboxlabel3 = get_node("/root/Textbox/TextBox/VBoxContainer/HBoxContainer2/Label")


func _ready():
	interactNumber = 0
	print("Initialized loresign.gd")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print(interactNumber)
		if global.closestInteractable == "loresign":
			if interactNumber == 0 && !global.cutscenePlaying:
				global.cutscenePlaying = true
				textbox.visible = true
				textboxlabel1.text = "In the year 22, we"
				textboxlabel2.text = "were at war."
				textboxlabel3.text = "It was clear that we"
				interactNumber += 1
			elif interactNumber == 1:
				print(global.cutscenePlaying)
				textboxlabel1.text = "were not going to win."
				textboxlabel2.text = "However, our enemy, Rubia"
				textboxlabel3.text = "had a powerful weapon:"
				interactNumber += 1
			elif interactNumber == 2:
				print(global.cutscenePlaying)
				textboxlabel1.text = "The legendary Elecree, "
				textboxlabel2.text = "Victorium."
				textboxlabel3.text = "Through Victorium, they"
				interactNumber += 1
			elif interactNumber == 3:
				textboxlabel1.text = "dropped two power spheres"
				textboxlabel2.text = "on this country. One here,"
				textboxlabel3.text = "and one in New Life City,"
				interactNumber += 1
			elif interactNumber == 4:
				textboxlabel1.text = "then known as Wide Isle City."
				textboxlabel2.text = "The spheres left enourmous"
				textboxlabel3.text = "craters, that are unsafe"
				interactNumber += 1
			elif interactNumber == 5:
				textboxlabel1.text = "to enter, even today."
				textboxlabel2.text = ""
				textboxlabel3.text = ""
				interactNumber += 1
			elif interactNumber == 6:
				textbox.visible = false
				global.cutscenePlaying = false
				interactNumber = 0
	if Input.is_action_just_pressed("ui_cancel"):
		print("Closest Interactable:" + global.closestInteractable)
		



func _on_Area2D_body_entered(body):
	print(body)
	if body.name == "Player":
		global.closestInteractable = "loresign"
	
func _on_Area2D_body_exited(body):
	global.closestInteractable = "null"

