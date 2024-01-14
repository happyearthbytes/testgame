@icon("res://icons/recent_actors_white_24dp.svg")
extends Node2D
class_name EnemyManager

@onready var timer : Timer = $Timer

var enemy_entity : PackedScene = preload("res://classes/enemy_entity.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var new_enemy = enemy_entity.instantiate()
	add_child(new_enemy)
	print("Here")
	
