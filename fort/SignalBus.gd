extends Node

signal new_direction(direction: Vector2)


#signal new_place()
#signal new_use_weapon()
#signal new_use_tool()

#signal new_pointer(pointer : Vector2)
#signal play_card(card_type: String)
signal select_card(card_val: C.CardV) # Debug only


signal card_event(event: Types.Card)

signal add_building(card_val: C.CardV)
signal select_building(card_val: C.CardV)
signal place_building(card_val: C.CardV)
signal delete_building(card_val: C.CardV)
