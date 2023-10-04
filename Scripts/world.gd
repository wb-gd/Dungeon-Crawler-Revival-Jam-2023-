extends Node3D

@export var Map: PackedScene

func _ready():
	generate_map()
	
func generate_map():
	if not Map is PackedScene: return
	var map = Map.instantiate()
	var tilemap = map.get_tilemap()
