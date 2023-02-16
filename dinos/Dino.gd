class_name Dino
extends CharacterBody2D

enum DinoState {IDLE, CHASE}

@export var dino: DinoResource

var speed: int
var acceleration: int
var friction: int
var health: int
var state: DinoState

@onready var sprite = $Sprite
@onready var health_bar = $HealthBar
@onready var food_detection_zone = $FoodDetectionZone
@onready var hitbox = $Hitbox


func _ready():
	# properties
	speed = dino.speed
	health = dino.max_health
	acceleration = dino.acceleration
	friction = dino.friction
	state = DinoState.IDLE
	velocity = Vector2.DOWN * 20

	# nodes
	health_bar.max_value = dino.max_health
	health_bar.value = dino.max_health


func _physics_process(delta):
	match state:
		DinoState.IDLE:
			state_idle(delta)
		DinoState.CHASE:
			state_chase(delta)
	move_and_slide()


func state_idle(delta: float) -> void:
	velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	seek_food()


func state_chase(delta: float) -> void:
	var data = food_detection_zone.data
	if data != null:
		var target_position = data.global_position - get_hitbox_center()
		accelerate_towards_point(target_position, delta)
	else:
		state = DinoState.IDLE


func get_hitbox_center() -> Vector2:
	return hitbox.get_node("CollisionShape2D").position


func accelerate_towards_point(point, delta):
	var direction = position.direction_to(point)
	velocity = velocity.move_toward(direction * speed, acceleration * delta)
	sprite.flip_h = velocity.x > 0


func _on_hurtbox_area_entered(_area):
	health -= 1
	health_bar.value = health


func seek_food():
	if food_detection_zone.is_detected():
		state = DinoState.CHASE
