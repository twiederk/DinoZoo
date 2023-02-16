extends GutTest

func test_can_instanciate():

	# act
	var plant = Plant.new()

	# assert
	assert_not_null(plant, "Should be instanciated")

	# tear down
	plant.free()
