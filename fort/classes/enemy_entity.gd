@icon("res://icons/sentiment_dissatisfied_white_24dp.svg")
extends Node2D
class_name EnemyEntity

@onready var character_entity : CharacterEntity = $CharacterEntity
@onready var enemy_ai : EnemyAI = $EnemyAI
@onready var character_attributes : CharacterAttributes = $CharacterAttributes
@onready var nav_region : NavigationRegion2D = get_node("/Game/NavigationRegion2D")

func _ready():
	character_entity.set_input_handler(enemy_ai)
	character_entity.set_character_attributes(character_attributes)
	enemy_ai.set_character(character_entity)
	enemy_ai.set_nav_region(nav_region)
