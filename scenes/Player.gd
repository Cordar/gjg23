extends CharacterBody2D

var jump_velocity: float = 20.0
var jump_timer: float = 0.0
var speed: float = 400.0
var vertical_force: float = 0.0
var gravity: float = 800.0

func _physics_process(delta):

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		jump_timer = 0.0
		vertical_force = 35.0

	# Apply gravity when not on the floor
	if not is_on_floor():
		$PlayerHell/AnimatedSprite.play("jump")
		$PlayerHeaven/AnimationPlayer.play("jump")
		transform.origin.y += delta * gravity
	else:
		$PlayerHell/AnimatedSprite.play("run")
		$PlayerHeaven/AnimationPlayer.play("run")
	vertical_force -= 60.0 * delta
	if vertical_force < 0.0: 
		vertical_force = 0.0
	transform.origin.y -= vertical_force

	# Move the player based on the calculated velocity
	transform.origin.x += speed * delta
	move_and_slide()

func _on_area_obstacles_body_entered(_body:Node2D):
	get_tree().reload_current_scene()

func activate_hell():
	$PlayerHeaven.visible = false
	$PlayerHell.visible = true
	$AreaObstacles.set_collision_mask_value(2, true)
	$AreaObstacles.set_collision_mask_value(3, false)

func activate_heaven():
	$PlayerHeaven.visible = true
	$PlayerHell.visible = false
	$AreaObstacles.set_collision_mask_value(2, false)
	$AreaObstacles.set_collision_mask_value(3, true)
