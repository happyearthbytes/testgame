@icon("res://icons/mood_white_24dp.svg")
extends Node2D
class_name PlayerEntity


@onready var input_handler : InputHandler = $InputHandler
@onready var character_entity : CharacterEntity = $CharacterEntity
@onready var character_attributes : CharacterAttributes = $CharacterAttributes
func _ready():
	character_entity.set_input_handler(input_handler)
	character_entity.set_character_attributes(character_attributes)
