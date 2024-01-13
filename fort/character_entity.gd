extends Node2D

class_name CharacterEntity

@export var new_action_manager : ActionManager
@onready var action_manager : ActionManager = $_ActionManager

func _ready():
	action_manager = new_action_manager
