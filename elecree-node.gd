extends Node2D
onready var global = get_node("/root/GlobalVars")
onready var wildgen = global.wildgen

var data: Elecree
var test_int: int = 4

func _ready():
	if global.wild:
		data = Elecree.new(wildgen[0], wildgen[1], wildgen[2], wildgen[3], wildgen[4], wildgen[5], wildgen[6])
