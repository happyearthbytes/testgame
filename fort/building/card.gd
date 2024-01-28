@tool
extends TextureButton

@export var card_val : C.CardV = C.CardV.None

var card : Types.Card = Types.Card.new()

func _get(property):
	if property == "card/action":
		return card.action
	if property == "card/value":
		return card.value
	if property == "card/type":
		return card.type
	
	if property == "card/selection":
		if card.type == C.CardType.Building:
			return card.building
		elif card.type == C.CardType.Enhancement:
			return card.enhancement
		elif card.type == C.CardType.Resource:
			return card.resource
		elif card.type == C.CardType.Event:
			return card.event
		elif card.type == C.CardType.Debug:
			return card.debug
		#
	#elif property == "card/building":
		#return card.building
	#elif property == "card/enhancement":
		#return card.enhancement
	#elif property == "card/resource":
		#return card.resource
	#elif property == "card/event":
		#return card.event
	#elif property == "card/debug":
		#return card.debug
		
func _set(property, val):
	if property == "card/action":
		card.action = val
	if property == "card/value":
		card.value = val
	if property == "card/type":            
		card.type = val
		notify_property_list_changed()
	if property == "card/selection":
		if card.type == C.CardType.Building:
			card.building = val
		elif card.type == C.CardType.Enhancement:
			card.enhancement = val
		elif card.type == C.CardType.Resource:
			card.resource = val
		elif card.type == C.CardType.Event:
			card.event = val
		elif card.type == C.CardType.Debug:
			card.debug = val
		#
	#if property == "card/building":
		#card.building = val
	#if property == "card/enhancement":
		#card.enhancement = val
	#if property == "card/resource":
		#card.resource = val
	#if property == "card/event":
		#card.event = val
	#if property == "card/debug":
		#card.debug = val
	return true

func _get_property_list():
	var property_list = []
	property_list.append({
		"name": "card/action",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": ",".join(C.CardAction.keys()),
		"usage": PROPERTY_USAGE_DEFAULT,
	})
	property_list.append({
		"name": "card/value",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_NONE,
		"usage": PROPERTY_USAGE_DEFAULT,
	})
	property_list.append({
		"name": "card/type",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": ",".join(C.CardType.keys()),
		"usage": PROPERTY_USAGE_DEFAULT,
	})
	
	var hint_str = ""
	if card.type == C.CardType.Building:
		hint_str = ",".join(C.Buildings.keys())
	elif card.type == C.CardType.Enhancement:
		hint_str = ",".join(C.Enhancements.keys())
	elif card.type == C.CardType.Resource:
		hint_str = ",".join(C.Resources.keys())
	elif card.type == C.CardType.Event:
		hint_str = ",".join(C.Events.keys())
	elif card.type == C.CardType.Debug:
		hint_str = ",".join(C.Debug.keys())
	property_list.append({
		"name": "card/selection",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": hint_str,
		"usage": PROPERTY_USAGE_DEFAULT,
	})
		#
	#if card.type == C.CardType.Building:
		#property_list.append({
			#"name": "card/building",
			#"type": TYPE_INT,
			#"hint": PROPERTY_HINT_ENUM,
			#"hint_string": ",".join(C.Buildings.keys()),
			#"usage": PROPERTY_USAGE_DEFAULT,
		#})
	#elif card.type == C.CardType.Enhancement:
		#property_list.append({
			#"name": "card/enhancement",
			#"type": TYPE_INT,
			#"hint": PROPERTY_HINT_ENUM,
			#"hint_string": ",".join(C.Enhancements.keys()),
			#"usage": PROPERTY_USAGE_DEFAULT,
		#})
	#elif card.type == C.CardType.Resource:
		#property_list.append({
			#"name": "card/resource",
			#"type": TYPE_INT,
			#"hint": PROPERTY_HINT_ENUM,
			#"hint_string": ",".join(C.Resources.keys()),
			#"usage": PROPERTY_USAGE_DEFAULT,
		#})
	#elif card.type == C.CardType.Event:
		#property_list.append({
			#"name": "card/event",
			#"type": TYPE_INT,
			#"hint": PROPERTY_HINT_ENUM,
			#"hint_string": ",".join(C.Event.keys()),
			#"usage": PROPERTY_USAGE_DEFAULT,
		#})
	#elif card.type == C.CardType.Debug:
		#property_list.append({
			#"name": "card/debug",
			#"type": TYPE_INT,
			#"hint": PROPERTY_HINT_ENUM,
			#"hint_string": ",".join(C.Debug.keys()),
			#"usage": PROPERTY_USAGE_DEFAULT,
		#})
	return property_list

func _ready():
	if card_val != C.CardV.None:
		$Label.text = C.CardV.keys()[card_val]
	else:
		$Label.text = str(card)

func _on_pressed():
	Sig.select_card.emit(card_val)
	Sig.card_event.emit(card)
