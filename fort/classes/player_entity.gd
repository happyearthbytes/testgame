@icon("res://icons/mood_white_24dp.svg")
extends Node2D
class_name PlayerEntity

@onready var action_manager : ActionManager = $ActionManager
@onready var input_handler : InputHandler = $InputHandler
@onready var character_entity : CharacterEntity = $CharacterEntity

func _ready():
	input_handler.new_direction.connect(action_manager._on_new_direction)
	character_entity.set_action_manager(action_manager)
