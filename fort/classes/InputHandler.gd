@icon("res://icons/gamepad_white_24dp.svg")
extends Node

class_name InputHandler

signal new_direction(direction: Vector2)
signal new_place()
signal new_use_weapon()
signal new_use_tool()
signal new_pointer(pointer : Vector2)

var place : bool = false:
	set(place_in):
		place = place_in
		if place:
			new_place.emit()
var use_weapon : bool = false:
	set(use_weapon_in):
		use_weapon = use_weapon_in
		if use_weapon:
			new_use_weapon.emit()
var use_tool : bool = false:
	set(use_tool_in):
		use_tool = use_tool_in
		if use_tool:
			new_use_tool.emit()
var pointer : Vector2 = Vector2.ZERO:
	set(pointer_in):
		if pointer != pointer_in:
			pointer = pointer_in
			new_pointer.emit(pointer)
var next_direction : Vector2 = Vector2.ZERO
var input_direction : Vector2 = Vector2.ZERO:
	set(direction):
		if direction != input_direction:
			input_direction = direction
			new_direction.emit(input_direction)
			


# Called when the node enters the scene tree for the first time.
func _ready():
	input_direction = Vector2.ZERO
	custom_ready()

func custom_ready():
	pass

func get_action():
	pass
	
func get_direction():
	pass

func _process(delta):
	get_direction()
	get_action()
