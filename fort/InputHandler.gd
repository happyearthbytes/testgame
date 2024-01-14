@icon("res://icons/gamepad_white_24dp.svg")
extends Node

class_name InputHandler

signal new_direction(direction: Vector2)

var next_direction : Vector2 = Vector2.ZERO
var input_direction : Vector2 = Vector2.ZERO:
	set(direction):
		if direction != input_direction:
			input_direction = direction
			new_direction.emit(input_direction)

# Called when the node enters the scene tree for the first time.
func _ready():
	input_direction = Vector2.ZERO

func get_direction():
	next_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).limit_length()
	next_direction.normalized()
	input_direction = next_direction

func _process(delta):
	get_direction()
