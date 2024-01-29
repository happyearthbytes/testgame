@tool
extends TextureButton

var event : Types.Event = Types.Event.new()

func _get(property):
	if not event:
		return
	#if property == "card/action":
		#return card.action
	#if property == "card/value":
		#return card.value
	if property == "card/type":
		return event.type
	if property == "card/selection":
		if event.type == Types.Event.T.UI:
			return event.ui.type
		if event.type == Types.Event.T.CardChoice:
			return event.card_choice.type
		#if card.type == C.CardType.Building:
			#return card.building
		#elif card.type == C.CardType.Enhancement:
			#return card.enhancement
		#elif card.type == C.CardType.Resource:
			#return card.resource
		#elif card.type == C.CardType.Debug:
			#return card.debug

func _set(property, val):
	if not event or val == null:
		return false
	#if property == "card/action":
		#card.action = val
	#if property == "card/value":
		#card.value = val
	if property == "card/type":            
		event.type = val
		notify_property_list_changed()
	if property == "card/selection":
		if event.type == Types.Event.T.UI:
			event.ui.type = val
		if event.type == Types.Event.T.CardChoice:
			event.card_choice.type = val
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
	if not event:
		return property_list

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
		"hint_string": ",".join(Types.Event.T.keys()),
		"usage": PROPERTY_USAGE_DEFAULT,
	})
	#
	var hint_str = ""
	if event.type == Types.Event.T.UI:
		hint_str = ",".join(Types.UI.keys())
	elif event.type == Types.Event.T.CardChoice:
		hint_str = ",".join(Types.CardChoice.keys())
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
	if not event:
		return
	$Label.text = str(event)

func _ready():
	update_label()

func _on_pressed():
	Sig.event.emit(event)
