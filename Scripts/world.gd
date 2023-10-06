extends Node3D

const RoomScene = preload("res://Scenes/test_room.tscn")
@onready var RoomParent = $Rooms

@export var Map: PackedScene

func _ready():
	generate_map()
	
func generate_map():
	if not Map is PackedScene: return
	var map = Map.instantiate()
	var tilemap: TileMap = map.get_tilemap()
	var tiles = tilemap.get_used_cells(0)
	for tile in tiles:
		var room = RoomScene.instantiate()
		room.position = Vector3(tile.x, 0, tile.y)
		RoomParent.add_child(room)
