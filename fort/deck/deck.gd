extends Node2D

@onready var card_scene = preload("res://deck/card.tscn")
var cards : Array
var number_of_cards = 5
var card_spacing = 32 + 8
var count = 0

func _ready():
	cards = []
	for i in range(number_of_cards):
		var card = card_scene.instantiate()
		add_child(card)
		card.position.x = card.position.x + (i * card_spacing)
		cards.append(card)

func play_a_card():
	if len(cards) <= 0:
		print("no more")
		return
	print("Play card")
	Sig.play_card.emit("Card Type")
	var card = cards.pop_back()
	card.queue_free()

func _process(delta):
	if count % 200 == 0:
		play_a_card()
	count += 1
