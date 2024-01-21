extends Node

@onready var terrain_manager = $TerrainManager

func _ready():
	Sig.terrain_manager = terrain_manager

