extends Node2D

@onready var Map: TileMap = $TileMap

func get_tilemap():
	return Map
