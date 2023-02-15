extends GutTest


func test_can_instanciate():
	
	# act
	var dino = Dino.new()
	
	# assert
	assert_not_null(dino, "Should be instanciated")
	
	# tear down
	dino.free()
