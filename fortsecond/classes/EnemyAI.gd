@icon("res://icons/smart_toy_white_24dp.svg")
extends InputHandler
class_name EnemyAI

var character : CharacterBody
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

	
func _on_area_2d_body_entered(body: Node2D):
	get_target(body)
	
func _on_area_2d_body_exited(body: Node2D):
	if body == target:
		print("bye")
		target = character
	
func get_target(new_target: Node2D):
	if new_target is CharacterBody:
		if new_target.character_attributes.character_type == CharacterAttributes.CharacterType.PLAYER:
			print("got the target")
			target = new_target
			print(target)

func set_target_position():
	nav_agent.set_target_position(target.global_position)

func set_character(new_character: CharacterBody):
	character = new_character
	nav_agent.reparent(character)
	reparent(character)
	print("set parent")
	print(character)
			
func get_direction():
	if not target or not character:
		return
	set_target_position()
	next_direction = nav_agent.get_next_path_position() - character.global_position
	next_direction = next_direction.limit_length()
	next_direction.normalized()
	input_direction = next_direction

func _process(delta):
	if count % 50 == 0:
		get_direction()
	count += 1




