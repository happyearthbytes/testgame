@icon("res://icons/animation_white_24dp.svg")
extends Node2D
class_name AnimatedEntity


@export var texture2d : Texture2D
@onready var sprite : Sprite2D = $Sprite2D

func _ready():
	sprite.texture = texture2d
