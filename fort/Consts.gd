extends Node

@onready var building_scene = preload("res://building/building.tscn")
func get_building(building : Types.Building):
	var new_building = building_scene.instantiate()
	return new_building
