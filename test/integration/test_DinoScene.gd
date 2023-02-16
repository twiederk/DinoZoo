extends GutTest

const DinoScene = preload("res://dinos/Dino.tscn")

func test_ready():

	# arrange
	var dino_resource = DinoResource.new()
	dino_resource.speed = 10
	dino_resource.max_health = 10
	
	var dino = DinoScene.instantiate()
	dino.dino = dino_resource

	# act
	dino._ready()

	# assert
	assert_eq(dino.state, Dino.DinoState.IDLE, "Should start in IDLE state")
	
	# tear down
	dino.free()

