extends TileMap
var currentTile
var randomEncounter
var cdata = load("creatures.tres")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initialized getTileType.gd")


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	
	if get_cellv(world_to_map(get_parent().get_node("Player/Sprite").global_position)) == 33:
		randomEncounter = int(rand_range(1, 120))
		if randomEncounter == 69:
			if get_parent().get_node("Player").isMoving == true:
				var returnValue = cdata._calculateStats(int(rand_range(0, 5)),int(rand_range(0, 5)),int(rand_range(0, 5)),int(rand_range(0, 5)),int(rand_range(0, 5)),3,0)
				print(returnValue)
