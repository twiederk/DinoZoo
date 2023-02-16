extends GutTest

var detection_zone = null

func before_each():
	detection_zone = DetectionZone.new()


func after_each():
	detection_zone.free()


func test_can_instanciate():

	# act
	var my_detection_zone = DetectionZone.new()

	# assert
	assert_not_null(my_detection_zone, "Should be instancited")

	# tear down
	my_detection_zone.free()


func test_is_detected_nothing():

	# act
	var detected = detection_zone.is_detected()

	# assert
	assert_false(detected, "Should return false when nothing is detected")


func test_is_detected_something():

	# assert
	var node = Node.new()
	detection_zone.data = node

	# act
	var detected = detection_zone.is_detected()

	# assert
	assert_true(detected, "Should return true when nothing is detected")

	# tear down
	node.free()


func test_on_area_entered():

	# arrange
	var area2d = Area2D.new()

	# act
	detection_zone._on_area_entered(area2d)

	# assert
	assert_eq(detection_zone.data, area2d, "Should set data when area is entered")

	# tear down
	area2d.free()

func test_on_area_exited():
	
	# act
	detection_zone._on_area_exited(null)

	# assert
	assert_null(detection_zone.data, "Should set data to null when area is exited")
	

