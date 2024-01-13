extends Node

class_name InputHandler

@export var action_manager : ActionManager
var input_direction : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	input_direction = Vector2.ZERO

func get_direction():
	input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).limit_length()
	input_direction.normalized()
	action_manager.direction = input_direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_direction()
