@tool
extends TextureButton

var ok : bool = false
var card : Types.Card = Types.Card.new()

func _get(property):
	#if property == "card/action":
		#return card.action
	#if property == "card/value":
		#return card.value
	if property == "card/type":
		return card.type
	if property == "card/selection":
		if card.type == C.EventType.UI:
			return card.ui
		if card.type == C.EventType.CardChoice:
			return card.card_choice
		#if card.type == C.CardType.Building:
			#return card.building
		#elif card.type == C.CardType.Enhancement:
			#return card.enhancement
		#elif card.type == C.CardType.Resource:
			#return card.resource
		#elif card.type == C.CardType.Debug:
			#return card.debug
		
func _set(property, val):
	#if property == "card/action":
		#card.action = val
	#if property == "card/value":
		#card.value = val
	if property == "card/type":            
		card.type = val
		notify_property_list_changed()
	if property == "card/selection":
		if card.type == C.EventType.UI:
			card.ui = val
		if card.type == C.EventType.CardChoice:
			card.card_choice = val
		#if card.type == C.CardType.Building:
			#card.building = val
		#elif card.type == C.CardType.Enhancement:
			#card.enhancement = val
		#elif card.type == C.CardType.Resource:
			#card.resource = val

		#elif card.type == C.CardType.Debug:
			#card.debug = val
	update_label()
	return true

func _get_property_list():
	var property_list = []
	#property_list.append({
		#"name": "card/action",
		#"type": TYPE_INT,
		#"hint": PROPERTY_HINT_ENUM,
		#"hint_string": ",".join(C.CardAction.keys()),
		#"usage": PROPERTY_USAGE_DEFAULT,
	#})
	#property_list.append({
		#"name": "card/value",
		#"type": TYPE_INT,
		#"hint": PROPERTY_HINT_NONE,
		#"usage": PROPERTY_USAGE_DEFAULT,
	#})
	property_list.append({
		"name": "card/type",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": ",".join(C.EventType.keys()),
		"usage": PROPERTY_USAGE_DEFAULT,
	})
	#
	var hint_str = ""
	if card.type == C.EventType.UI:
		hint_str = ",".join(C.UI.keys())
	elif card.type == C.EventType.CardChoice:
		hint_str = ",".join(C.CardChoice.keys())
	#if card.type == C.CardType.Building:
		#hint_str = ",".join(C.Buildings.keys())
	##elif card.type == C.CardType.Enhancement:
		##hint_str = ",".join(C.Enhancements.keys())
	##elif card.type == C.CardType.Resource:
		##hint_str = ",".join(C.Resources.keys())

	##elif card.type == C.CardType.Debug:
		##hint_str = ",".join(C.Debug.keys())
	property_list.append({
		"name": "card/selection",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": hint_str,
		"usage": PROPERTY_USAGE_DEFAULT,
	})
	return property_list

func update_label():
	if not ok:
		return
	$Label.text = str(card)

func _ready():
	ok = true
	update_label()

func _on_pressed():
	Sig.card_event.emit(card)
