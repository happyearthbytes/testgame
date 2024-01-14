extends Node
class_name CharacterAttributes

signal new_speed(speed: float)

@export var speed : float = 10.0:
	set(speed_in):
		speed = speed_in
		new_speed.emit(speed)

func update():
	speed = speed
