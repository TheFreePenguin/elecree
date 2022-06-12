extends TileMap
var currentTile
var randomEncounter
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
				print("Random encounter will trigger in later versions.")
