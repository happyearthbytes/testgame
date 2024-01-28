extends Node2D



func _ready():
	Sig.add_building.connect(on_add_building)
	Sig.select_card.connect(on_select_card)

func on_select_card(card_type: C.CardT, card_val: C.CardV):
	print(C.CardV.keys()[card_val])
	if card_val == C.CardV.Add_Barracks:
		print("AAA")
		
func on_add_building(card_type: C.CardT, card_val: C.CardV):
	print("do the building")

