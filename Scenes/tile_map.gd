extends Node2D

var speed = 300  # pixels per second

@onready var tilemaps = [$TileMap1, $TileMap2]

func _ready():
	# Position the second TileMap above the first
	var height = tilemaps[0].tile_set.tile_size.y * tilemaps[0].get_used_rect().size.y
	tilemaps[1].position.y = tilemaps[0].position.y - height

func _process(delta):
	for tm in tilemaps:
		tm.position.y += speed * delta
		var height = tm.tile_set.tile_size.y * tm.get_used_rect().size.y
		if tm.position.y >= height:
			tm.position.y -= 2 * height
