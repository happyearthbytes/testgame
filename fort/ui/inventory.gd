extends Control

@onready var content = $MarginContainer
var toggle_state : bool = true

func _ready():
	Sig.card_event.connect(handle_event)

func handle_event(card: Types.Card):
	if card.ui == C.UI.Toggle_Inventory:
		toggle()

func toggle():
	toggle_state = !toggle_state
	if toggle_state:
		content.show()
	else:
		content.hide()
