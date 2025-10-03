extends Label


func _process(delta: float):
	text = "NAME: " + GlobalVars.player_name + "\nCREDITS: " + str(GlobalVars.credits) + "\nE-DEVICE: " + str(GlobalVars.caught_creatures) + "/70\nTIME: " + GlobalVars.time
	if Input.is_action_just_pressed("ui_cancel") && get_parent().visible == true:
		get_parent().get_node("TileMap").visible = false
		get_parent().visible = false
		GlobalVars.cutscenePlaying = false
