extends TextureButton

@export var card_type : C.CardT = C.CardT.Debug
@export var card_val : C.CardV = C.CardV.Toggle_Select_3

func _ready():
	$Label.text = C.CardV.keys()[card_val]


func _on_pressed():
	Sig.select_card.emit(card_type, card_val)
