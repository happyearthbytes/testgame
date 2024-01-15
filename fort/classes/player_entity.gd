@icon("res://icons/mood_white_24dp.svg")
extends Node2D
class_name PlayerEntity


@onready var controller_handler : InputHandler = $ControllerHandler
@onready var character_entity : CharacterEntity = $CharacterEntity
@onready var character_attributes : CharacterAttributes = $CharacterAttributes

func _ready():
	character_entity.set_input_handler(controller_handler)
	character_entity.set_character_attributes(character_attributes)
