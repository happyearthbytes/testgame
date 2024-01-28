extends Node
class_name Types

enum EventType{
	None,
	Debug,
	UI,
	CardChoice,
}
enum Debug{
	None,
}
enum UI{
	None,
	Toggle_Select_3,
	Toggle_Inventory,
}
enum CardChoice{
	None,
	Add,
	Select,
}

class UIEvent:
	var type: UI
	func _init():
		reset()
	func reset():
		type = UI.None
	func _to_string():
		return UI.keys()[type]

class Event:
	var type: EventType
	var ui: UIEvent = UIEvent.new()
	var card_choice: CardChoice
	func _init():
		reset()
	func reset():
		type = EventType.None
		ui.reset()
		card_choice = CardChoice.None
	func _to_string():
		var eventstr : String =  EventType.keys()[type]
		var typestr : String = ""
		if type == EventType.UI:
			typestr = UI.keys()[ui.type]
		if type == EventType.CardChoice:
			typestr = CardChoice.keys()[card_choice]
		return "%s %s" % [ eventstr, typestr]

#
#
#class Card:
	#var type: C.EventType
	#var ui: C.UI
	#var card_choice: C.CardChoice
	#
	##var building: C.Buildings
	##var enhancement: C.Enhancements
	##var resource: C.Resources
	##var action: C.CardAction
	##var debug: C.Debug
#
	##var value: int
	##var custom
	#func _init():
		#reset()
	#func reset():
		#type = C.EventType.None
		#ui = C.UI.None
		#card_choice = C.CardChoice.None
		##action = C.CardAction.None
		##debug = C.Debug.None
		##ui = C.UI.None
		##value = 1
		##custom = "-"
	#func _to_string():
		#var typestr : String = ""
		#if type == C.EventType.UI:
			#typestr = C.UI.keys()[ui]
		#if type == C.EventType.CardChoice:
			#typestr = C.CardChoice.keys()[card_choice]
		##if type == C.CardType.Building:
			##typestr = C.Buildings.keys()[building]
		##elif type == C.CardType.Enhancement:
			##typestr = C.Enhancement.keys()[enhancement]
		##elif type == C.CardType.Resource:
			##typestr = C.Resources.keys()[resource]
		##elif type == C.CardType.Debug:
			##typestr = C.Debug.keys()[debug]
		#return typestr
		##return "%s %s: %s %s (%s)" % [ C.CardAction.keys()[action], C.CardType.keys()[type], value, typestr, custom]
