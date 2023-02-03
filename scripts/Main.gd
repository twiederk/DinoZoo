extends Node2D

const BOTTON_LEFT = 1
const BOTTON_RIGHT = 2

const TILE_SET_LAYER = 0
const TILE_SET_SOURCE_ID = 1
const TILE_GRASS = Vector2(1, 7)
const TILE_FENCE = Vector2(1, 12)

var button_left_pressed : bool = false
var button_right_pressed : bool = false

@onready var tilemap = $IslandTileMap
@onready var camera = $Camera


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var map_position = tilemap.local_to_map(get_global_mouse_position())
			match event.button_index:
				BOTTON_LEFT:
					tilemap.set_cell(TILE_SET_LAYER, map_position, TILE_SET_SOURCE_ID, TILE_FENCE)
					button_left_pressed = true
				BOTTON_RIGHT:
					tilemap.set_cell(TILE_SET_LAYER, map_position, TILE_SET_SOURCE_ID, TILE_GRASS)
					button_right_pressed = true
		else:
			button_left_pressed = false
			button_right_pressed = false
	elif event is InputEventMouseMotion:
		if button_left_pressed:
			var map_position = tilemap.local_to_map(get_global_mouse_position())
			tilemap.set_cell(TILE_SET_LAYER, map_position, TILE_SET_SOURCE_ID, TILE_FENCE)
		if button_right_pressed:
			var map_position = tilemap.local_to_map(get_global_mouse_position())
			tilemap.set_cell(TILE_SET_LAYER, map_position, TILE_SET_SOURCE_ID, TILE_GRASS)


