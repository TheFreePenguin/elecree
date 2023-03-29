extends Node
var cdata = load("creatures.tres")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(ev):
	var returnValue = cdata._calculateStats(15,15,15,15,15,15,0)
	if ev is InputEventKey and ev.scancode == KEY_K:
		print(returnValue)
