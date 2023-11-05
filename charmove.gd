extends AnimationPlayer
onready var global = get_node("/root/GlobalVars")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initialized charmove.gd")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var lastdir: String = "s"

func _process(delta):
	if global.cutscenePlaying == false:
		if Input.is_action_pressed("ui_left"):
			lastdir = "w"
			set_current_animation("walk_w")
		
		elif Input.is_action_pressed("ui_right"):
			lastdir = "e"
			set_current_animation("walk_e")
		
		elif Input.is_action_pressed("ui_up"):
			lastdir = "n"
			set_current_animation("walk_n")
		
		elif Input.is_action_pressed("ui_down"):
			lastdir = "s"
			set_current_animation("walk_s")
	# I know this is beginner code but it doesn't matter if the cat is black or white as long as it catches mice
		else:
			set_current_animation("idle_" + lastdir)
	else:
		set_current_animation("idle_" + lastdir)
