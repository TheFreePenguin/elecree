extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initialized warp_rebirth_1.gd")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_Area2D_body_entered(body):
	print("This will warp the player to Road 1 in the future")
	print(body.name + " has triggered the collision.")
