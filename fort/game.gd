extends Node

var id : ID = ID.new("game","main")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	print(id) 
	print(id.children())
	id.next_child("block")
	id.next_child("block")
	id.next_child("block")
	print(id.children())
	id.remove_child_inst("block.2")
	print(id.children())
	#var id = ID.id("xx","yy")
	#myid = ID.new("me")
	#print(myid)
	#var newid = maker.new()
	#print(newid)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
