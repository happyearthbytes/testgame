@icon("res://icons/sentiment_dissatisfied_white_24dp.svg")
extends Node
class_name EnemyEntity

@onready var action_manager : ActionManager = $ActionManager
@onready var character_entity : CharacterEntity = $CharacterEntity
@onready var enemy_ai : EnemyAI = $EnemyAI

func _ready():
	enemy_ai.new_direction.connect(action_manager._on_new_direction)
	character_entity.set_action_manager(action_manager)
