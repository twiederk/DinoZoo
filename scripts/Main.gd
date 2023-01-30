extends Node

var tilemap = null

# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap = $TileMap
#	tilemap.set_cell(x, y, index)
#void set_cell(layer: int, coords: Vector2i, source_id: int = -1, atlas_coords: Vector2i = Vector2i(-1, -1), alternative_tile: int = 0)
	for index in 12:
		tilemap.set_cell(0, Vector2(index, index), 2, Vector2.ZERO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
