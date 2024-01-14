@icon("res://icons/smart_toy_white_24dp.svg")
extends Node2D
class_name EnemyAI

signal new_direction(direction: Vector2)

var next_direction : Vector2 = Vector2.ZERO
var input_direction : Vector2 = Vector2.ZERO:
	set(direction):
		if direction != input_direction:
			input_direction = direction
			new_direction.emit(input_direction)

func _ready():
	input_direction = Vector2.ZERO

func get_direction():
	next_direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).limit_length()
	next_direction.normalized()
	input_direction = next_direction

func _process(delta):
	get_direction()
