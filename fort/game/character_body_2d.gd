extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0,0)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_animation_params(starting_direction)

func update_animation_params(move_param : Vector2):
	if(move_param != Vector2.ZERO):
		animation_tree.set("parameters/Idle/blend_position",move_param)
		animation_tree.set("parameters/Walk/blend_position",move_param)
	set_animation_state()

func set_animation_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = input_direction * move_speed
	update_animation_params(input_direction)
	move_and_slide()