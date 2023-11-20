extends Button

var normalButton = preload("res://assets/button.png")
var hoverButton = preload("res://assets/button_hover.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	icon = hoverButton


func _on_mouse_exited():
	icon = normalButton


func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
