@icon("res://icons/account_box_white_24dp.svg")
extends CharacterBody2D
class_name CharacterEntity

var direction = Vector2.ZERO
var speed = 100.0


func set_input_handler():
	Sig.new_direction.connect(_on_new_direction)

func _on_new_direction(direction_in: Vector2):
	print(direction_in)
	direction=direction_in
	

func _ready():
	set_input_handler()

func _physics_process(_delta):
	velocity = direction * speed
	print(velocity)
	move_and_slide()
