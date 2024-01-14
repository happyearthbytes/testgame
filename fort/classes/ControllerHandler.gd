extends InputHandler
class_name ControllerHandler

func _ready():
	input_direction = Vector2.ZERO
	custom_ready()

func custom_ready():
	pass

func get_action():
	if Input.is_action_just_pressed("place"):
		place = true
	if Input.is_action_just_released("place"):
		place = false
	if Input.is_action_just_pressed("use_weapon"):
		use_weapon = true
	if Input.is_action_just_released("use_weapon"):
		use_weapon = false
	if Input.is_action_just_pressed("use_tool"):
		use_weapon = true
	if Input.is_action_just_released("use_tool"):
		use_weapon = false

func get_pointer():
	pointer = get_viewport().get_mouse_position()


func get_direction():
	next_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).limit_length()
	next_direction.normalized()
	input_direction = next_direction

func _process(delta):
	get_direction()
	get_action()
	get_pointer()
