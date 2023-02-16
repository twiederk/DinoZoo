class_name DetectionZone
extends Area2D

var data = null

func is_detected() -> bool:
	return data != null


func _on_area_entered(area):
	print("DetectionZone._on_area_entered()")
	data = area


func _on_area_exited(_area):
	data = null
