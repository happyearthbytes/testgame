extends Node

var id : ID = ID.new("game","root")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(id)
	print(id.children())
	id.next_child("block")
	print(id.children())
	id.next_child("block")
	print(id.children())
	id.new_child("a","b")
	print(id.children())
	id.new_child("x")
	print(id.children())
	id.new_child("a","c")
	print(id.children())
	id.new_child("x","bb")
	print(id.children())
	id.next_child("x")
	print(id.children())
	
func _process(delta):
	pass
