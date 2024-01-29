extends Control

@onready var content = $MarginContainer
@onready var container = $MarginContainer/TextureRect/HBoxContainer
@onready var card_scene = preload("res://building/card.tscn")
var contents : Array
const MAX_CARDS : int = 3

var toggle_state : bool = true

func _ready():
	Sig.event.connect(handle_event)
	for i in range(MAX_CARDS):
		var choice = Types.CardChoice.new()
		add_choice(choice)

func handle_event(ev: Types.Event):
	if ev.type == Types.Event.T.UI:
		if ev.ui.type == Types.UI.T.Toggle_Select_3:
			toggle()
	if ev.type == Types.Event.T.CardChoice:
		if ev.card_choice.type == Types.CardChoice.T.Add:
			add_choice(ev.card_choice)


func add_choice(choice : Types.CardChoice):
	if choice.card.type == Types.Card.T.Building:
		if len(contents) >= MAX_CARDS:
			return 
		var new_building = C.get_building(choice.card.building)
		var new_card = card_scene.instantiate()
		contents.append(new_card)
		new_card.add_child(new_building)
		container.add_child(new_card)

func toggle():
	toggle_state = !toggle_state
	if toggle_state:
		content.show()
	else:
		content.hide()

