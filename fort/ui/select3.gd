extends Control

@onready var content = $MarginContainer
var on_select3_toggle : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():

	Sig.select_card.connect(on_check_select_card)

func on_check_select_card(card_type: C.CardT, card_val: C.CardV):
	if card_type == C.CardT.Debug:
		if card_val == C.CardV.Toggle_Select_3:
			on_select3_toggle = !on_select3_toggle
			on_select3(on_select3_toggle)

func on_select3(show: bool):
	if show:
		content.show()
	else:
		content.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
