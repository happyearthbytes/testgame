extends CharacterBody2D

@export var move_speed : float = 50
@export var starting_direction : Vector2 = Vector2(0,0)

@onready var animation_tree = $AnimationTree
@onready var state_machine : AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")

var use_weapon : bool = false :
	set(use):
		use_weapon = use
		if use_weapon:
			state_machine.travel("Weapon")
	get:
		return use_weapon

func _input(event : InputEvent):
	if(event.is_action_pressed("use_weapon")):
		use_weapon = true

func _ready():
	update_animation_params(starting_direction)

func update_animation_params(move_param : Vector2):
	if(move_param != Vector2.ZERO):
		animation_tree.set("parameters/Idle/blend_position",move_param)
		animation_tree.set("parameters/Walk/blend_position",move_param)
		animation_tree.set("parameters/Weapon/blend_position",move_param)
	set_animation_state()

func set_animation_state():
	if use_weapon:
		use_weapon=false
		return
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).limit_length()
	input_direction.normalized()
	#use_weapon = Input.get_action_strength("use_weapon")
	
	velocity = input_direction * move_speed
	update_animation_params(input_direction)
	if state_machine.get_current_node() == "Weapon":
		velocity /= 3
	move_and_slide()
