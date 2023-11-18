extends CharacterBody2D


var jumpVelocity:float = 0.0
var jumpTimer:float = 0.0
var direction = 0.0
var speed = 200

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position.x += speed * delta

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


func _on_area_obstacles_body_entered(body:Node2D):
	get_tree().reload_current_scene()
