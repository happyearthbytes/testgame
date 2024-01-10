extends CharacterBody2D

@onready var nav : NavigationAgent2D = $NavigationAgent2D
@export var direction : Vector2 = Vector2()
var destination : Vector2 = Vector2.ZERO:
	set(d):
		destination = d

var speed = 300
var accel = 7
	
func _physics_process(delta):
	await get_tree().process_frame
	nav.target_position = get_global_mouse_position()
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	velocity = velocity.lerp(direction * speed, accel * delta)

	move_and_slide()
