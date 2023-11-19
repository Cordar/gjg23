extends Node

var is_dimension_heaven = false

var heavenBackgroundTexture = preload("res://assets/heaven/background_full.png")
var hellBackgroundTexture = preload("res://assets/hell/Fondo.png")
@onready var _background = $ParallaxBackground/ParallaxLayer/Background

func _input(event):
	if(event.is_action_released("change_dimension")):
		change_dimension()

func change_dimension():
	is_dimension_heaven = not is_dimension_heaven
	if is_dimension_heaven:
		_background.set_texture(heavenBackgroundTexture)
		$Player.activate_heaven()
		show_heaven(true)
		show_hell(false)
	else:
		_background.set_texture(hellBackgroundTexture)
		$Player.activate_hell()
		show_heaven(false)
		show_hell(true)

func show_heaven(show: bool = true):
	for item in $ObstaclesHeaven.get_children():
		if show:
			show_item(item)
		else:
			hide_item(item)

func show_hell(show: bool = true):
	for item in $ObstaclesHell.get_children():
		if show:
			show_item(item)
		else:
			hide_item(item)

func show_item(item):
	item.show()

func hide_item(item):
	item.hide()
