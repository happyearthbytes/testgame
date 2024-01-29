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
	var ui: UIEvent = UIEvent.new()
	var card_choice: CardChoiceEvent = CardChoiceEvent.new()
	func _init():
		reset()
	func reset():
		type = T.None
		ui.reset()
		card_choice.reset()
	func _to_string():
		var eventstr : String =  T.keys()[type]
		var typestr : String = ""
		if type == T.UI:
			typestr = str(ui)
		if type == T.CardChoice:
			typestr = str(card_choice)
		return "%s %s" % [ eventstr, typestr]

enum BuildingType{
	None,
	Barracks,
	ArcheryRange,
	Gym,
}
class Building:
	var type: BuildingType
	var level: int
	func _init():
		reset()
	func reset():
		type = BuildingType.None
		level = 1
	func _to_string():
		return BuildingType.keys()[type]
	
enum ResourcesType{
	None,
	Wood,
	Stone,
}
class Resources:
	var type: ResourcesType
	var amount: int
	func _init():
		reset()
	func reset():
		type = ResourcesType.None
		amount = 1
	func _to_string():
		return ResourcesType.keys()[type]
		
enum EnhancementType{
	None,
	AddHP,
	AddSpeed,
}
class Enhancement:
	var type: EnhancementType
	var amount: int
	func _init():
		reset()
	func reset():
		type = EnhancementType.None
		amount = 1
	func _to_string():
		return EnhancementType.keys()[type]
		
enum CardType{
	None,
	Building,
	Resource,
	Enhancement,
}
class Card:
	var type: CardType
	var building: Building
	var resources: Resources
	var enhancement: Enhancement
	func _init():
		building = Building.new()
		resources = Resources.new()
		enhancement = Enhancement.new()
		reset()
	func reset():
		type = CardType.None
		building.reset()
		resources.reset()
		enhancement.reset()
	func _to_string():
		return CardChoice.keys()[type]

enum CardChoice{
	None,
	Add,
	Select,
}

class CardChoiceEvent:
	var type: CardChoice
	var card_type: CardType
	func _init():
		reset()
	func reset():
		type = CardChoice.None
		card_type = CardType.None
	func _to_string():
		return CardChoice.keys()[type]

enum UI{
	None,
	Toggle_Select_3,
	Toggle_Inventory,
}
class UIEvent:
	var type: UI
	func _init():
		reset()
	func reset():
		type = UI.None
	func _to_string():
		return UI.keys()[type]

enum Debug{
	None,
}
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
