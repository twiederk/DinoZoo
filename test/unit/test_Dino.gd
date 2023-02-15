extends GutTest


var dino : Dino = null

func before_each():
	dino = Dino.new()


func after_each():
	dino.free()


func test_can_instanciate():

	# act
	var dino = Dino.new()

	# assert
	assert_not_null(dino, "Should be instanciated")

	# tear down
	dino.free()


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
	
