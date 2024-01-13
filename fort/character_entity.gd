extends Node2D

class_name CharacterEntity

var action_manager : ActionManager
@onready var body : CharacterBody = $CharacterBody

func set_action_manager(new_action_manager : ActionManager):
	action_manager = new_action_manager
	_connect_action_manager()

func _connect_action_manager():
	action_manager.new_velocity.connect(body._on_new_velocity)
