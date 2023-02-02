class_name Dino
extends CharacterBody2D

var speed: int = 30

var dinos = [
	preload("res://resources/Ankylosaurus.tres"),
	preload("res://resources/Brontosaurus.tres"),
	preload("res://resources/Spinosaurus.tres"),
	]

var direction = [
	Vector2(1, 0),
	Vector2(-1, 0),
	Vector2(0, -1),
	Vector2(0, 1)
	]

@onready var sprite = $Sprite
@onready var shadow_sprite = $ShadowSprite
@onready var collision_shape = $CollisionShape2D


func _ready():
	randomize()
	var dino = dinos[randi() % dinos.size()]
	speed = dino.speed
	shadow_sprite.texture = dino.shadow
	sprite.position = dino.center
	sprite.texture = dino.texture
	collision_shape.shape = dino.collision_shape
	velocity = direction[randi() % direction.size()] * speed


func _physics_process(_delta):
	var collide = move_and_slide()
	if collide:
		velocity = direction[randi() % direction.size()] * speed
		
