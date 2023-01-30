class_name Dino
extends Area2D

var textures = [
	'Ankylosaurus.png',
	'Brontosaurus.png',
	'Spinosaurus.png',
	]

var tile_size = 16
var can_move = true
var facing = 'right'
var moves = {
	'right': Vector2(1, 0),
	'left': Vector2(-1, 0),
	'up': Vector2(0, -1),
	'down': Vector2(0, 1)
	}

var raycasts = {
	'right': 'RayCastRight',
	'left': 'RayCastLeft',
	'up': 'RayCastUp',
	'down': 'RayCastDown'
	}


func _ready():
	randomize()
	var texture = textures[randi() % textures.size()]
	texture = load("res://assets/%s" % texture)
	$Sprite.texture = texture
	facing = moves.keys()[randi() % 4]


func _process(_delta):
	if can_move:
		if not move(facing) or randi() % 10 > 5:
			facing = moves.keys()[randi() % 4]


func move(dir: String) -> bool:
	if get_node(raycasts[facing]).is_colliding():
		return false
	facing = dir
	can_move = false
	$Timer.start()
#	$AnimationPlayer.play(facing)
#	$MoveTween.interpolate_property(self, "position", position,
#		position + moves[facing] * tile_size, 0.8,
#		Tween.TRANS_SINE, Tween.EASE_IN_OUT)
#	$MoveTween.start()
	position = position + moves[facing] * tile_size
	return true


func _on_Timer_timeout():
	can_move = true
