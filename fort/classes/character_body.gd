@icon("res://icons/attribution_white_24dp.svg")
extends CharacterBody2D
class_name CharacterBody
	
@onready var collision_shape : CollisionShape2D = $_CollisionShape2D
@export var shape2d : Shape2D

func _on_new_velocity(new_velocity : Vector2):
	velocity = new_velocity

func _ready():
	collision_shape.shape = shape2d
	velocity = Vector2.ZERO

func _physics_process(_delta):
	move_and_slide()

	
