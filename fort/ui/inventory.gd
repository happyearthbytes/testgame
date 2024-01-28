extends Control

@onready var content = $MarginContainer
var toggle_state : bool = true

func _ready():
	Sig.select_card.connect(on_toggle)
	Sig.add_building.connect(on_add_building)

func on_add_building(card_val: C.CardV):
	print(card_val)

func on_toggle(card_val: C.CardV):
	if card_val == C.CardV.Toggle_Inventory:
		toggle_state = !toggle_state
		toggle(toggle_state)

func toggle(show_content: bool):
	if show_content:
		content.show()
	else:
		content.hide()
