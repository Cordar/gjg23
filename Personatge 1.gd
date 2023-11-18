extends CharacterBody2D


var jumpVelocity:float = 0.0
var jumpTimer:float = 0.0
var direction = 0.0

func _ready():
	pass # Replace with function body.

func _process(delta):

	if (Input.is_action_just_pressed("ui_up")):
		jumpVelocity = -600 - abs(direction / 3)

	if (Input.is_action_pressed("ui_up") && jumpTimer < 0.25):
		velocity.y = jumpVelocity
		jumpTimer += delta

	if (!Input.is_action_pressed("ui_up") && is_on_floor()):
		jumpTimer = 0.0
		jumpVelocity = 0.0

	if (!is_on_floor()):
		velocity.y += 40

	velocity.x = (velocity.x + direction) / 2
	move_and_slide()
