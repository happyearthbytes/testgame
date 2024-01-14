@icon("res://icons/account_box_white_24dp.svg")
extends Node2D
class_name CharacterEntity

@onready var body : CharacterBody = $CharacterBody
@onready var action_manager : ActionManager = $ActionManager
var character_attributes : CharacterAttributes
var input_handler : InputHandler

func set_character_attributes(new_character_attributes : CharacterAttributes):
	character_attributes = new_character_attributes
	character_attributes.new_speed.connect(action_manager._on_new_speed)
	character_attributes.new_texture.connect(body._on_new_texture)
	character_attributes.new_shape.connect(body._on_new_shape)
	character_attributes.update()
	body.character_attributes = character_attributes

func set_input_handler(new_input_handler : InputHandler):
	input_handler = new_input_handler
	input_handler.new_direction.connect(action_manager._on_new_direction)
	input_handler.new_pointer.connect(action_manager._on_new_pointer)
	input_handler.new_use_weapon.connect(action_manager._on_new_use_weapon)
	input_handler.new_use_tool.connect(action_manager._on_new_use_tool)
	input_handler.new_place.connect(action_manager._on_new_place)
	
func _set_action_manager(new_action_manager : ActionManager):
	action_manager = new_action_manager
	action_manager.new_velocity.connect(body._on_new_velocity)


func _ready():
	_set_action_manager(action_manager)
