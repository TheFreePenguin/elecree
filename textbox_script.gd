extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		print(self.visible)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
