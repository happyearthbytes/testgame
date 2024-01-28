extends Node

class_name Types

class Card:
	var type: C.CardType
	var building: C.Buildings
	var enhancement: C.Enhancements
	var resource: C.Resources
	var action: C.CardAction
	var debug: C.Debug
	var event: C.Events
	var value: int
	var custom
	func _init():
		reset()
	func reset():
		type = C.CardType.None
		action = C.CardAction.None
		debug = C.Debug.None
		event = C.Events.None
		value = 1
		custom = "-"
	func _to_string():
		var typestr : String = ""
		if type == C.CardType.Building:
			typestr = C.Buildings.keys()[building]
		elif type == C.CardType.Enhancement:
			typestr = C.Enhancement.keys()[enhancement]
		elif type == C.CardType.Resource:
			typestr = C.Resources.keys()[resource]
		elif type == C.CardType.Event:
			typestr = C.Events.keys()[event]
		elif type == C.CardType.Debug:
			typestr = C.Debug.keys()[debug]
		return "%s %s: %s %s (%s)" % [ C.CardAction.keys()[action], C.CardType.keys()[type], value, typestr, custom]
