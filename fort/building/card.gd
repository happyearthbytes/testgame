@tool
extends TextureButton

var event : Types.Event = Types.Event.new()

func _get(property):
	if not event:
		return
	if property == "event/type":
		return event.type
	if property == "event/selection":
		if event.type == Types.Event.T.UI:
			return event.ui.type
		if event.type == Types.Event.T.CardChoice:
			return event.card_choice.type
	if property == "event/card/type":
		if event.type == Types.Event.T.CardChoice:
			return event.card_choice.card.type


func _set(property, val):
	if not event or val == null:
		return false
	if property == "event/type":            
		event.type = val
	if property == "event/selection":
		if event.type == Types.Event.T.UI:
			event.ui.type = val
		if event.type == Types.Event.T.CardChoice:
			event.card_choice.type = val
	if property == "event/card/type":
		if event.type == Types.Event.T.CardChoice:
			event.card_choice.card.type = val
	if property == "event/card/attrs/selection":
		if event.type == Types.Event.T.CardChoice:
			if event.card_choice.card.type == Types.Card.T.Building:
				event.card_choice.card.building.type = val
			if event.card_choice.card.type == Types.Card.T.Enhancement:
				event.card_choice.card.enhancement.type = val
			if event.card_choice.card.type == Types.Card.T.Resources:
				event.card_choice.card.resources.type = val
	if property == "event/card/attrs/val":
		if event.type == Types.Event.T.CardChoice:
			if event.card_choice.card.type == Types.Card.T.Building:
				event.card_choice.card.building.val = val
			if event.card_choice.card.type == Types.Card.T.Enhancement:
				event.card_choice.card.enhancement.val = val
			if event.card_choice.card.type == Types.Card.T.Resources:
				event.card_choice.card.resources.val = val
	notify_property_list_changed()
	update_label()
	return true

func _get_property_list():
	var property_list = []
	if not event:
		return property_list

	property_list.append({
		"name": "event/type",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": ",".join(Types.Event.T.keys()),
		"usage": PROPERTY_USAGE_DEFAULT,
	})
	
	var hint_str = ""
	var card_choice = false
	
	if event.type == Types.Event.T.UI:
		hint_str = ",".join(Types.UI.T.keys())
	elif event.type == Types.Event.T.CardChoice:
		hint_str = ",".join(Types.CardChoice.T.keys())
		card_choice = true
	property_list.append({
		"name": "event/selection",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": hint_str,
		"usage": PROPERTY_USAGE_DEFAULT,
	})
	if card_choice:
		hint_str = ",".join(Types.Card.T.keys())
		property_list.append({
			"name": "event/card/type",
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
