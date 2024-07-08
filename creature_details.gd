extends Node2D
class_name CreatureDetails

var creature: int

var attack: int
var offset: int

func _process(delta: float):
	var gparent: CreatureSelector = get_parent().get_parent()
	if gparent.in_details:
		if Input.is_action_just_pressed("ui_left"):
			change_creature(-1)
			#creature %= gparent.creatures
		if Input.is_action_just_pressed("ui_right"):
			change_creature(1)
			#creature %= gparent.creatures
		if Input.is_action_just_pressed("ui_cancel"):
			gparent.in_details = false
			gparent.hide_items()
			hide()
			GlobalVars.cutscenePlaying = false
		if Input.is_action_just_pressed("ui_down"):
			var ecreature: Elecree = team.team[creature]
			if attack == 5:
				print("offsetting")
				offset += 1 if attack + offset + 1 <= ecreature.attacks.size() else 0
			else:
				attack += 1 if attack + offset + 1 <= ecreature.attacks.size() else 0
			get_node("Attacks").bbcode_text = color_lines(attack)
		if Input.is_action_just_pressed("ui_up"):
			var ecreature: Elecree = team.team[creature]
			if attack == 1:
				print("offsetting")
				offset -= 1 if attack + offset - 1 > 0 else 0
			else:
				attack -= 1 if attack + offset - 1 > 0 else 0
			get_node("Attacks").bbcode_text = color_lines(attack)

func creature_changed():
	attack = 1
	offset = 0
	var ecreature: Elecree = team.team[creature]
	get_node("Stats").text = "HP: " + str(ecreature.stathp) + "\n" + "AT: " + str(ecreature.statat) + "\n" + "DF: " + str(ecreature.statdf) + "\n" + "SP: " + str(ecreature.statsp) + "\n" + "ST: " + str(ecreature.statst) 
	get_node("ID").text = "No. " + str(ecreature.species)
	get_node("NameAndLevel").text = ecreature.get_name() + " :L" + str(ecreature.level)
	get_node("Attacks").bbcode_text = color_lines(1)
	print(get_node("Attacks").bbcode_enabled)

func change_creature(by: int):
	creature += by
	creature %= get_parent().get_parent().creatures
	creature_changed()

func color_lines(number: int) -> String:
	var attack_list: String = get_first_five_attacks(team.team[creature], offset)
	var arr: Array = attack_list.split("\n")
	for s in arr.size():
		if number == s:
			arr[s] = "[color=#FFFFFF]" + arr[s] + "[/color]"
		else:
			arr[s] = "[color=#000000]" + arr[s] + "[/color]"
	return "\n".join(arr)

func get_first_five_attacks(elecree: Elecree, _offset: int = 0) -> String:
	var st: String = "Attacks:\n"
	print("Offset: " + str(offset))
	print("Attack size: " + str(elecree.attacks.size()))
	for at in elecree.attacks.size():
		if at < _offset:
			continue
		st += elecree.attacks[at]
		print("Adding " + elecree.attacks[at])
		print("Size is " + str(st.split("\n").size()))
		if st.split("\n").size() >= 6:
			break
		st += "\n"
	print(st)
	return st
		
		
