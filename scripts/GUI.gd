class_name GUI
extends Control

var level_name: String

func _on_next_level_pressed():
	Global.level_completed.emit(level_name)
