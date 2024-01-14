@icon("res://icons/smart_toy_white_24dp.svg")
extends InputHandler
class_name EnemyAI

var character : CharacterEntity
var target : Node2D
@onready var collider : Area2D = $Area2D
@onready var nav_agent : NavigationAgent2D = $NavigationAgent2D
var nav_region : NavigationRegion2D
var count : int = 0

func custom_ready():
	nav_agent.debug_enabled = true

func set_nav_region(nav_region_in: NavigationRegion2D):
	print("set the nav region")
	nav_region = nav_region_in
	nav_agent.set_navigation_map(nav_region)
	print(nav_region)
	
func _on_area_2d_body_entered(body: Node2D):
	get_target(body)

func get_target(new_target: Node2D):
	if new_target is CharacterBody:
		print("got the target")
		target = new_target
		print(target)

func set_target_position():
	nav_agent.set_target_position(target.global_position)

func set_character(new_character: CharacterEntity):
	character = new_character
	nav_agent.reparent(character.body)
	print("set parent")
	print(character.body)
			
func get_direction():
	if not target or not character:
		return
	set_target_position()
	next_direction = nav_agent.get_next_path_position() - character.body.global_position
	next_direction = next_direction.limit_length()
	next_direction.normalized()
	input_direction = next_direction

func _process(delta):
	if count % 50 == 0:
		get_direction()
	count += 1

