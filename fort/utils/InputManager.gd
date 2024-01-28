extends Node

var input_signaler : InputSignaler
var input_direction : Vector2

func _ready():
	input_signaler = InputSignaler.new()


func get_action():
	if Input.is_action_just_pressed("place"):
		input_signaler.place = true
	if Input.is_action_just_released("place"):
		input_signaler.place = false
	if Input.is_action_just_pressed("use_weapon"):
		input_signaler.use_weapon = true
	if Input.is_action_just_released("use_weapon"):
		input_signaler.use_weapon = false
	if Input.is_action_just_pressed("use_tool"):
		input_signaler.use_tool = true
	if Input.is_action_just_released("use_tool"):
		input_signaler.use_tool = false
		
func get_pointer():
	input_signaler.pointer = get_viewport().get_mouse_position()


func get_direction():
	var next_direction : Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).limit_length()
	next_direction.normalized()
	input_signaler.input_direction = next_direction

func _process(_delta):
	get_direction()
	get_action()
	get_pointer()
