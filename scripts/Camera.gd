class_name Camera
extends Camera2D

const ZOOM_MIN: Vector2 = Vector2(0.5, 0.5)
const ZOOM_MAX: Vector2 = Vector2(5.0, 5.0)
const ZOOM_STEP: Vector2 = Vector2(0.1, 0.1)

@export var speed: int = 10

func _process(delta):
	if Input.is_action_pressed("up"):
		position += Vector2(0, -speed)
	if Input.is_action_pressed("down"):
		position += Vector2(0, speed)
	if Input.is_action_pressed("left"):
		position += Vector2(-speed, 0)
	if Input.is_action_pressed("right"):
		position += Vector2(speed, 0)
	if Input.is_action_just_pressed("zoom_in"):
		zoom(ZOOM_STEP)
	if Input.is_action_just_pressed("zoom_out"):
		zoom(-ZOOM_STEP)


func zoom(scale: Vector2) -> void:
	var zoom = get_zoom()
	zoom += scale
	zoom = clamp(zoom, ZOOM_MIN, ZOOM_MAX)
	set_zoom(zoom)

