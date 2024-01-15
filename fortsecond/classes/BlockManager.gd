@icon("res://icons/grid_view_white_24dp.svg")
extends Node2D
class_name BlockManager
var block_entity : PackedScene = preload("res://classes/block_entity.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_request_block(new_position: Vector2):
	var new_block : BlockEntity = block_entity.instantiate()
	new_block.position = new_position
	add_child(new_block)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
