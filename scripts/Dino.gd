class_name Dino
extends CharacterBody2D


@export var dino: DinoResource

var speed: int = 30
var health: int = 0
var direction = [
	Vector2(1, 0),
	Vector2(-1, 0),
	Vector2(0, -1),
	Vector2(0, 1)
	]

@onready var sprite = $Sprite
@onready var shadow_sprite = $ShadowSprite
@onready var collision_shape = $CollisionShape2D
@onready var health_bar = $HealthBar


func _ready():
	randomize()
	speed = dino.speed
	health = dino.max_health
	shadow_sprite.texture = dino.shadow
	sprite.position = dino.center
	sprite.texture = dino.texture
	health_bar.max_value = dino.max_health
	health_bar.value = dino.max_health
	collision_shape.shape = dino.collision_shape
	velocity = direction[randi() % direction.size()] * speed


func _physics_process(_delta):
	var collide = move_and_slide()
	if collide:
		velocity = direction[randi() % direction.size()] * speed


func _on_hurtbox_area_entered(area):
	health -= 1
	health_bar.value = health

