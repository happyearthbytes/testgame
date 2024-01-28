extends Node2D

var hover : bool = false
var pressed : bool = false
func _on_area_2d_mouse_entered():
	hover = true

func _on_area_2d_mouse_exited():
	hover = false

func _process(_delta):
	if pressed:
		var pos = (In.e.last().position)
		global_position = pos

func _on_area_2d_input_event(viewport, event, shape_idx):
	var e = In.get_event(event).last()
	if e.click == In.Click.L:
		if e.pressed != pressed:
			pressed = e.pressed
		if pressed:
			global_position = e.position


