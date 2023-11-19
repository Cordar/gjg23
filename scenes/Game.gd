extends Node

var is_dimension_heaven = true

var heavenBackgroundTexture = preload("res://assets/Background/Pink.png")
var hellBackgroundTexture = preload("res://assets/Background/Green.png")
@onready var _background = $ParallaxBackground/ParallaxLayer/Background

func _input(event):
	if(event.is_action_released("change_dimension")):
		change_dimension()

func change_dimension():
	is_dimension_heaven = not is_dimension_heaven
	if is_dimension_heaven:
		_background.set_texture(heavenBackgroundTexture)
		$Player.activate_heaven()
	else:
		_background.set_texture(hellBackgroundTexture)
		$Player.activate_hell()
