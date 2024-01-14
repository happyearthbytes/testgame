@icon("res://icons/attribution_white_24dp.svg")
extends CharacterBody2D
class_name CharacterBody

signal new_texture(texture: Texture2D)

@onready var collision_shape : CollisionShape2D = $_CollisionShape2D
@onready var collision_area : CollisionShape2D = $Area2D/_CollisionShape2D
@onready var animated_entity : AnimatedEntity = $AnimatedEntity
#@export var shape2d : Shape2D
var texture : Texture2D
var shape : Shape2D
var area_shape : Shape2D
var character_attributes : CharacterAttributes

func _on_new_texture(texture_in : Texture2D):
	texture = texture_in
	new_texture.emit(texture)

func _on_new_area(new_area : Shape2D):
	area_shape = new_area
	collision_area.shape = area_shape

func _on_new_shape(new_shape : Shape2D):
	shape = new_shape
	collision_shape.shape = shape

func _on_new_velocity(new_velocity : Vector2):
	velocity = new_velocity

func _ready():
	velocity = Vector2.ZERO
	new_texture.connect(animated_entity._on_new_texture)
	
	
func _physics_process(_delta):
	move_and_slide()

	
