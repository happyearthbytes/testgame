extends CharacterBody2D

var SPEED = 50

func _physics_process(delta):


	var direction = Vector2(1,0)
	velocity= direction * SPEED

	move_and_slide()
