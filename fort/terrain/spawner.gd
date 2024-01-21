extends Marker2D

var count : int = 0

@onready var character = preload("res://player/character.tscn")


func _ready():
	Sig.play_card.connect(spawn_character)
	
func spawn_character(card_type: String):
	var new_character = character.instantiate()
	add_child(new_character)
	print("New character ", card_type)


func _process(delta):
	pass
