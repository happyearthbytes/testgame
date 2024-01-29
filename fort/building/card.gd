@tool
extends TextureButton

var event : Types.Event = Types.Event.new()
@onready var label = $Label

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
	if property == "event/card/attrs/selection":
		if event.type == Types.Event.T.CardChoice:
			if event.card_choice.card.type == Types.Card.T.Building:
				return event.card_choice.card.building.type
			if event.card_choice.card.type == Types.Card.T.Enhancement:
				return event.card_choice.card.enhancement.type
			if event.card_choice.card.type == Types.Card.T.Resources:
				return event.card_choice.card.resources.type
	if property == "event/card/attrs/val":
		if event.type == Types.Event.T.CardChoice:
			if event.card_choice.card.type == Types.Card.T.Building:
				return event.card_choice.card.building.val
			if event.card_choice.card.type == Types.Card.T.Enhancement:
				return event.card_choice.card.enhancement.val
			if event.card_choice.card.type == Types.Card.T.Resources:
				return event.card_choice.card.resources.val

func _set(property, val):
	if not event or val == null:
		return false
	if property == "event/type":            
		event.type = val
	elif property == "event/selection":
		if event.type == Types.Event.T.UI:
			event.ui.type = val
		elif event.type == Types.Event.T.CardChoice:
			event.card_choice.type = val
	elif property == "event/card/type":
		if event.type == Types.Event.T.CardChoice:
			event.card_choice.card.type = val
	elif property == "event/card/attrs/selection":
		if event.type == Types.Event.T.CardChoice:
			if event.card_choice.card.type == Types.Card.T.Building:
				event.card_choice.card.building.type = val
			elif event.card_choice.card.type == Types.Card.T.Enhancement:
				event.card_choice.card.enhancement.type = val
			elif event.card_choice.card.type == Types.Card.T.Resources:
				event.card_choice.card.resources.type = val
	elif property == "event/card/attrs/val":
		if event.type == Types.Event.T.CardChoice:
			if event.card_choice.card.type == Types.Card.T.Building:
				event.card_choice.card.building.val = val
			elif event.card_choice.card.type == Types.Card.T.Enhancement:
				event.card_choice.card.enhancement.val = val
			elif event.card_choice.card.type == Types.Card.T.Resources:
				event.card_choice.card.resources.val = val
	else:
		return false
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
		
		var selection_hint_str : String = ""
		var val_hint_type = PROPERTY_HINT_NONE
		if event.card_choice.card.type == Types.Card.T.Building:
			selection_hint_str = ",".join(Types.Building.T.keys())
			val_hint_type = PROPERTY_HINT_NONE
		elif event.card_choice.card.type == Types.Card.T.Enhancement:
			selection_hint_str = ",".join(Types.Enhancement.T.keys())
			val_hint_type = PROPERTY_HINT_NONE
		elif event.card_choice.card.type == Types.Card.T.Resources:
			selection_hint_str = ",".join(Types.Resources.T.keys())
			val_hint_type = PROPERTY_HINT_NONE

		property_list.append({
			"name": "event/card/attrs/selection",
			"type": TYPE_INT,
			"hint": PROPERTY_HINT_ENUM,
			"hint_string": selection_hint_str,
			"usage": PROPERTY_USAGE_DEFAULT,
		})
		property_list.append({
			"name": "event/card/attrs/val",
			"type": TYPE_INT,
			"hint": val_hint_type,
			"usage": PROPERTY_USAGE_DEFAULT,
		})
	
	return property_list

func add_building(building_node):
	$CenterContainer.add_child(building_node)

func update_label():
	if event == null:
		return
	if label != null:
		label.text = str(event)

func _ready():
	update_label()

func _on_pressed():
	Sig.event.emit(event)
