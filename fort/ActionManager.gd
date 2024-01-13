
extends Node
class_name ActionManager

var direction : Vector2 = Vector2(0,0):
	set(direction_vec2):
		direction = direction_vec2
	get:
		return direction
var velocity : Vector2 = Vector2(0,0):
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

func _ready():
	direction = Vector2(0,0)
	velocity = Vector2(0,0)
	speed = 0.0

func _physics_process(delta):
	velocity = direction * speed
