extends Marker2D

var count : int = 0

@onready var character = preload("res://player/character.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if count % 1000 == 0:
		var new_character = character.instantiate()
		add_child(new_character)
		print("New character")
	count += 1
