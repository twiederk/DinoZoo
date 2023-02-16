extends GutTest


var dino : Dino = null

func before_each():
	dino = Dino.new()


func after_each():
	dino.free()


func test_can_instanciate():

	# act
	var my_dino = Dino.new()

	# assert
	assert_not_null(my_dino, "Should be instanciated")

	# tear down
	my_dino.free()


func test_on_hurtbox_area_entered():

	# arrange
	var health_bar = ProgressBar.new()
	dino.health_bar = health_bar
	dino.health = 10
	var area2D = Area2D.new()

	# act
	dino._on_hurtbox_area_entered(area2D)

	# assert
	assert_eq(dino.health, 9, "Should decrease health by 1")

	# tear down
	area2D.free()
	health_bar.free()


func test_state_idle():

	# arrange
	dino.velocity = Vector2(10, 0)
	dino.friction = 1
	var food_detection_zone = DetectionZone.new()
	dino.food_detection_zone = food_detection_zone

	# act
	dino.state_idle(1.0)

	# assert
	assert_eq(dino.velocity, Vector2(9, 0), "Should reduce velocity")

	# tear down
	food_detection_zone.free()


func test_seek_food_detected():

	# arrange
	var node = Node.new()
	var food_detection_zone = DetectionZone.new()
	food_detection_zone.data = node
	dino.food_detection_zone = food_detection_zone

	# act
	dino.seek_food()

	# assert
	assert_eq(dino.state, Dino.DinoState.CHASE, "Should chase food")

	# tear down
	node.free()
	food_detection_zone.free()

