extends Node2D

var data: Elecree

func _ready():
	var team = load("res://team.tres")
	#data = Elecree.new(3,3,3,3,3,3,0)
	data = team.team[0]
	print(team.team)
	print(team.test_int)
