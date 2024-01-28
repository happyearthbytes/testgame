extends Control

@onready var content = $MarginContainer
var toggle_state : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Sig.select_card.connect(on_toggle)

func on_toggle(card_val: C.CardV):
	if card_val == C.CardV.Toggle_Select_3:
		toggle_state = !toggle_state
		toggle(toggle_state)

func toggle(show_content: bool):
	if show_content:
		content.show()
	else:
		content.hide()
