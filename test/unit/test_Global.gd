extends GutTest


func test_get_level_resource():
	# arrange
	var global = GlobalScript.new()
	
	# act
	var level_resouce = global._get_level_resource("001")
	
	# assert
	assert_eq(level_resouce, "res://scenes/Level_002.tscn", "Should load next level")
	
	# tear down
	global.free()

