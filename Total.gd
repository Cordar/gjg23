extends Node


var canChange = false
var changeTimer: Timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _process(delta):
	
	# Check if canChange is false and start the timer
	if not canChange:
		changeTimer.start(3)
		canChange = true
	elif (canChange && Input.is_action_pressed("ui_accept")):
		# Change the scene to "res://OtherScene.tscn" asynchronously
		get_tree().change_scene_to_file("res://Hellscene.tscn")
		canChange = false
