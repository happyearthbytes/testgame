extends CharacterBody2D
class_name CharacterBody
	
@onready var collision_shape : CollisionShape2D = $_CollisionShape2D
@onready var action_manager : ActionManager = $_ActionManager
@export var new_action_manager : ActionManager
@export var shape2d : Shape2D

func _ready():
	collision_shape.shape = shape2d
	action_manager = new_action_manager

func _physics_process(delta):
	if action_manager:
		velocity = action_manager.get_velocity()
		move_and_slide()

	
