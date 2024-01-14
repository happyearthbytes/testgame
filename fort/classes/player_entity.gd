@icon("res://icons/mood_white_24dp.svg")
extends Node2D
class_name PlayerEntity


@onready var controller_handler : InputHandler = $ControllerHandler
@onready var character_entity : CharacterEntity = $CharacterEntity
@onready var character_attributes : CharacterAttributes = $CharacterAttributes

var block_manager : BlockManager:
	set(block_manager_in):
		block_manager = block_manager_in
var weapon_manager : WeaponManager:
	set(weapon_manager_in):
		weapon_manager = weapon_manager_in
var tool_manager : ToolManager:
	set(tool_manager_in):
		tool_manager = tool_manager_in

func _ready():
	character_entity.set_input_handler(controller_handler)
	character_entity.set_character_attributes(character_attributes)
