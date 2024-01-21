extends Node


@onready var block = preload("res://block.tscn")

var tiles : Array
var pos : Vector2
var curs : Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Sig.new_pointer.connect(_on_new_pointer)
	Sig.new_place.connect(_on_new_place)
	curs = block.instantiate()
	add_child(curs)

func _on_new_pointer(val: Vector2):
	pos = val
	curs.position = Sig.terrain_manager.nearest_point(pos)

func _on_new_place():
	var new_block : Node2D = block.instantiate()
	Sig.terrain_manager.add_at_position(pos,1,new_block)
	add_child(new_block)
	

func _process(delta):
	pass
