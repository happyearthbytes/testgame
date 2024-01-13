
extends Node
class_name ActionManager

const DEFAULT_DIRECTION : Vector2 = Vector2(0,0)
const DEFAULT_VELOCITY : Vector2 = Vector2(0,0)
const DEFAULT_SPEED: float = 100.0

signal new_velocity(velocity: Vector2)

var direction : Vector2 = DEFAULT_DIRECTION:
	set(direction_vec2):
		direction = direction_vec2
	get:
		return direction
var velocity : Vector2 = DEFAULT_VELOCITY:
	set(velocity_val):
		velocity = velocity_val
	get:
		return velocity
var speed : float = DEFAULT_SPEED:
	set(speed_val):
		speed = speed_val
	get:
		return speed

func get_velocity():
	return velocity

func _on_new_direction(direction_vec2: Vector2):
	direction = direction_vec2

func _on_new_speed(speed_val: float):
	speed = speed_val

func _ready():
	direction = DEFAULT_DIRECTION
	velocity = DEFAULT_VELOCITY
	speed = DEFAULT_SPEED

func _physics_process(_delta):
	velocity = direction * speed
	new_velocity.emit(velocity)
