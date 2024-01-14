@icon("res://icons/star_white_24dp.svg")
extends Node2D

@onready var enemy_manager : EnemyManager = $EnemyManager
@onready var player_controller : PlayerController = $PlayerController
@onready var camera : Camera2D = $PlayerController/LocalPlayer/Camera2D
@onready var block_manager : BlockManager = $BlockManager
@onready var ui_manager : UIManager = $UIManager
@onready var weapon_manager : WeaponManager = $WeaponManager
@onready var tool_manager : ToolManager = $ToolManager
@onready var terrain_manager : TerrainManager = $TerrainManager

var local_player : PlayerEntity

# Called when the node enters the scene tree for the first time.
func _ready():
	player_controller.camera = camera
	player_controller.block_manager = block_manager
	player_controller.weapon_manager = weapon_manager
	player_controller.tool_manager = tool_manager



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
