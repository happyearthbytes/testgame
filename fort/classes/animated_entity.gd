@icon("res://icons/animation_white_24dp.svg")
@tool
extends Node2D
class_name AnimatedEntity

func _on_new_texture(texture : Texture2D):
	sprite.texture = texture

@onready var sprite : Sprite2D = $Sprite2D
