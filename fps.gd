extends Label

var framerate: int
var f_alr_pressed: bool = false

func _process(delta: float):
	framerate = int(1 / delta)
	text = "FPS: " + str(framerate)
	
	if Input.is_key_pressed(KEY_F):
		if !f_alr_pressed:
			get_parent().visible = !get_parent().visible
			f_alr_pressed = true
	else:
		f_alr_pressed = false
