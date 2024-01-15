@icon("res://icons/engineering_white_24dp.svg")
extends Node2D
class_name PlayerController

@onready var local_player : PlayerEntity = $LocalPlayer
var camera : Camera2D:
	set(camera_in):
		camera = camera_in
		camera.reparent(local_player.character_entity.body)

var block_manager : BlockManager:
	set(block_manager_in):
		block_manager = block_manager_in
		#local_player.block_manager = block_manager
var weapon_manager : WeaponManager:
	set(weapon_manager_in):
		weapon_manager = weapon_manager_in
		#local_player.weapon_manager = weapon_manager
var tool_manager : ToolManager:
	set(tool_manager_in):
		tool_manager = tool_manager_in
		#local_player.tool_manager = tool_manager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
