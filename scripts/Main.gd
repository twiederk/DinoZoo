extends Node2D

const BOTTON_LEFT = 1
const BOTTON_RIGHT = 2

const TILE_GRASS = 1
const TILE_FENCE = 2

var button_left_pressed : bool = false
var button_right_pressed : bool = false

@onready var tilemap = $TileMap




func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var map_position = tilemap.local_to_map(event.position)
			match event.button_index:
				BOTTON_LEFT:
					tilemap.set_cell(0, map_position, TILE_FENCE, Vector2.ZERO)
					button_left_pressed = true
				BOTTON_RIGHT:
					tilemap.set_cell(0, map_position, TILE_GRASS, Vector2.ZERO)
					button_right_pressed = true
		else:
			button_left_pressed = false
			button_right_pressed = false
	elif event is InputEventMouseMotion:
		if button_left_pressed:
			var map_position = tilemap.local_to_map(event.position)
			tilemap.set_cell(0, map_position, TILE_FENCE, Vector2.ZERO)
		if button_right_pressed:
			var map_position = tilemap.local_to_map(event.position)
			tilemap.set_cell(0, map_position, TILE_GRASS, Vector2.ZERO)




