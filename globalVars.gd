extends Node
var currentScene: String
#var destinationScene: String
var posMod: Vector2
var currentPos: Vector2
var cutscenePlaying: bool
var closestInteractable: String = "null"
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initialized globalVars.gd")
	cutscenePlaying = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _warpPlayer(destination: Vector2, destination_scene: String):
	get_tree().change_scene("res://" + destination_scene + ".tscn")
	yield(get_tree(), "idle_frame")
	get_node(String(get_tree().current_scene.get_path()) + "/Player").global_position = destination
	get_node(String(get_tree().current_scene.get_path()) + "/Player/Sprite").global_position = get_node(String(get_tree().current_scene.get_path()) + "/Player").global_position
	get_node(String(get_tree().current_scene.get_path()) + "/Player/CollisionShape2D").global_position = get_node(String(get_tree().current_scene.get_path()) + "/Player").global_position
	

