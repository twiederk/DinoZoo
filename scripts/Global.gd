class_name GlobalScript
extends Node

signal level_completed(level_number)

func _ready():
	Global.level_completed.connect(_on_level_completed)


func _on_level_completed(level_name: String) -> void:
	var level_resource = _get_level_resource(level_name)
	get_tree().change_scene_to_file(level_resource)

func _get_level_resource(level_name: String) -> String:
	var level_resource
	match level_name:
		"001": level_resource = "res://scenes/Level_002.tscn"
		"002": level_resource = "res://scenes/Level_001.tscn"
	return level_resource
