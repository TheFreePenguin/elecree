extends Node2D

var data: Elecree

func _ready():
	var team = get_node("/root/team")
	#data = Elecree.new(3,3,3,3,3,3,0)
	data = team.team[0]
	print(team.team)
