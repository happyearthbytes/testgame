@icon("res://icons/smart_toy_white_24dp.svg")
extends InputHandler
class_name EnemyAI

var target : Node2D
var character : CharacterEntity
var targets : Array[CharacterEntity]
@onready var collider : Area2D = $Area2D
@onready var nav_agent : NavigationAgent2D = $NavigationAgent2D
@onready var nav_region : NavigationRegion2D = get_node("../NavigationRegion2D")

func custom_ready():
	nav_agent.set_navigation_map(nav_region)

func _on_area_2d_body_entered(body: Node2D):
	get_target(body)

func get_target(new_target: Node2D):
	target = new_target
	nav_agent.set_target_position(target.global_position)

func set_character(new_character: CharacterEntity):
	character = new_character

func get_direction():
	if not target or not character:
		return
	next_direction = target.global_position - character.body.global_position
	next_direction = next_direction.limit_length()
	next_direction.normalized()
	input_direction = next_direction

func _process(delta):
	get_direction()


