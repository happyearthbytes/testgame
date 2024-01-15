@icon("res://icons/settings_accessibility_white_24dp.svg")
extends Node
class_name ActionManager

signal new_velocity(velocity: Vector2)

var direction : Vector2 = Vector2.ZERO:
	set(direction_vec2):
		direction = direction_vec2
	get:
		return direction
var velocity : Vector2 = Vector2.ZERO:
	set(velocity_val):
		velocity = velocity_val
	get:
		return velocity
var speed : float = 0.0:
	set(speed_val):
		speed = speed_val
	get:
		return speed

func get_velocity():
	return velocity

func _on_new_pointer(pointer_in: Vector2):
	print("set_pointer")
	print(pointer_in)

func _on_new_use_weapon():
	print("use_weapon")

func _on_new_use_tool():
	print("use_tool")

func _on_new_place():
	print("place")

func _on_new_direction(direction_vec2: Vector2):
	direction = direction_vec2

func _on_new_speed(speed_val: float):
	speed = speed_val

func _ready():
	direction = Vector2.ZERO
	velocity = Vector2.ZERO
	speed = 0.0

func _physics_process(_delta):
	velocity = direction * speed
	new_velocity.emit(velocity)
