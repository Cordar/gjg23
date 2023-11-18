extends Node

var is_dimension_heaven = true

var heavenBackgroundTexture = preload("res://assets/Background/Pink.png")
var hellBackgroundTexture = preload("res://assets/Background/Green.png")

func _process(_delta):
	if Input.is_action_pressed("change_dimension"):
		print("change dimension")
		change_dimension()

func change_dimension():
	is_dimension_heaven = not is_dimension_heaven
	if is_dimension_heaven:
		$Player/Background.set_texture(heavenBackgroundTexture)
	else:
		$Player/Background.set_texture(hellBackgroundTexture)
