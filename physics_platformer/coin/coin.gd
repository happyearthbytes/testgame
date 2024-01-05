class_name Coin extends Area2D

var taken = false

var Player := preload("res://player/player.tscn")


func _on_body_enter(body):
	if not taken and body is Player:
		($AnimationPlayer as AnimationPlayer).play("taken")
