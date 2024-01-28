@icon("res://icons/gamepad_white_24dp.svg")
extends Node
class_name InputSignaler

#var place : bool = false:
	#set(place_in):
		#place = place_in
		#if place:
			#Sig.new_place.emit()
#var use_weapon : bool = false:
	#set(use_weapon_in):
		#use_weapon = use_weapon_in
		#if use_weapon:
			#Sig.new_use_weapon.emit()
#var use_tool : bool = false:
	#set(use_tool_in):
		#use_tool = use_tool_in
		#if use_tool:
			#Sig.new_use_tool.emit()
#var pointer : Vector2 = Vector2.ZERO:
	#set(pointer_in):
		#if pointer != pointer_in:
			#pointer = pointer_in
			#Sig.new_pointer.emit(pointer)
var input_direction : Vector2 = Vector2.ZERO:
	set(direction):
		if direction != input_direction:
			input_direction = direction
			Sig.new_direction.emit(input_direction)
