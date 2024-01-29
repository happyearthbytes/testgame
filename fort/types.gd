extends Node
class_name Types

class Event:
	enum T{
		None,
		Debug,
		UI,
		CardChoice,
	}
	var type: T
	var ui: UI = UI.new()
	var card_choice: CardChoice = CardChoice.new()
	func _init():
		reset()
	func reset():
		type = T.None
		ui.reset()
		card_choice.reset()
	func _to_string():
		var tstr : String =  T.keys()[type]
		var typestr : String = ""
		if type == T.UI:
			typestr = str(ui)
		if type == T.CardChoice:
			typestr = str(card_choice)
		return "%s %s" % [ tstr, typestr ]

class Building:
	enum T{
		None,
		Barracks,
		ArcheryRange,
		Gym,
	}
	var type: T
	var val: int
	func _init():
		reset()
	func reset():
		type = T.None
		val = 1
	func _to_string():
		var tstr : String =  T.keys()[type]
		var vstr : String = str(val)
		return "%s %s" %[tstr, vstr]
	
class Resources:
	enum T{
		None,
		Wood,
		Stone,
	}
	var type: T
	var val: int
	func _init():
		reset()
	func reset():
		type = T.None
		val = 1
	func _to_string():
		var tstr : String =  T.keys()[type]
		var vstr : String = str(val)
		return "%s %s" %[tstr, vstr]

class Enhancement:
	enum T{
		None,
		AddHP,
		AddSpeed,
	}
	var type: T
	var val: int
	func _init():
		reset()
	func reset():
		type = T.None
		val = 1
	func _to_string():
		var tstr : String =  T.keys()[type]
		var vstr : String = str(val)
		return "%s %s" %[tstr, vstr]
		
class Card:
	enum T{
		None,
		Building,
		Resources,
		Enhancement,
	}
	var type: T
	var building: Building
	var resources: Resources
	var enhancement: Enhancement
	func _init():
		building = Building.new()
		resources = Resources.new()
		enhancement = Enhancement.new()
		reset()
	func reset():
		type = T.None
		building.reset()
		resources.reset()
		enhancement.reset()
	func _to_string():
		var tstr : String =  T.keys()[type]
		var cardstr : String = ""
		if type == T.Building:
			cardstr = str(building)
		if type == T.Resources:
			cardstr = str(resources)
		if type == T.Enhancement:
			cardstr = str(enhancement)
		return "%s %s" %[tstr, cardstr]

class CardChoice:
	enum T{
		None,
		Add,
		Select,
	}
	var type: T
	var card: Card
	func _init():
		card = Card.new()
		reset()
	func reset():
		type = T.None
		card.reset()
	func _to_string():
		var tstr : String =  T.keys()[type]
		var vstr : String = str(card)
		return "%s %s" %[tstr, vstr]

class UI:
	enum T{
		None,
		Toggle_Select_3,
		Toggle_Inventory,
	}
	var type: T
	func _init():
		reset()
	func reset():
		type = T.None
	func _to_string():
		var tstr : String =  T.keys()[type]
		return "%s" %[tstr]

class Debug:
	enum T{
		None,

	}
	var type: T
	func _init():
		reset()
	func reset():
		type = T.None
	func _to_string():
		var tstr : String =  T.keys()[type]
		return "%s" %[tstr]

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
