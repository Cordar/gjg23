extends CharacterBody2D

class_name Obstacle1

var speed = 20
var velocy = Vector2()

func _physics_process(delta):
	velocy.x = -1  # Set the x-component of velocity
	velocy = velocity.normalized() * speed * delta
	velocy = move_and_collide(velocy)

func _on_Hurt_area_entered(HurtBox):
	queue_free()

func _on_Life_timeout():
	queue_free()
