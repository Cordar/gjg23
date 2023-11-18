extends CharacterBody2D

class_name Obstacle1

# Function that moves the object from right to left of the screen


func _on_Hurt_area_entered(HurtBox):
	queue_free()

func _on_Life_timeout():
	queue_free()
