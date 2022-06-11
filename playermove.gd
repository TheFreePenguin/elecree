extends KinematicBody2D

var velocity = Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initialized playermove.gd")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
# warning-ignore:unused_argument
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 1
	
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
	else:
		velocity.y = 0
	# MOTION!
# warning-ignore:return_value_discarded
	move_and_collide(velocity)

