extends Node2D

var data: Elecree

func _ready():
	var team = get_node("/root/team")
	#data = Elecree.new(3,3,3,3,3,3,0)
	data = team.team[0]
	print(team.team)

func attack(target: Elecree, attack: String):
	yield(get_parent().display_text([data.get_name() + " used " + attack + "!"]), "completed")
	data.attack(target, attack)
