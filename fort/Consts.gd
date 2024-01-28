extends Node

enum EventType{
	None,
	Debug,
	UI,
	CardAction,
}
enum Debug{
	None,
}
enum UI{
	None,
	Toggle_Select_3,
	Toggle_Inventory,
}
# Actions that apply to all standard cards
enum CardAction{
	None,
	AddChoice,
	Select,
	Add,
	Delete,
	CustomAction,
}


#
#enum Resources{
	#None,
	#Wood,
	#Stone,
#}
#enum Enhancements{
	#None,
	#MoreHP,
	#MoreSpeed,
#}
#enum Buildings{
	#None,
	#Barracks,
	#Archery_Range,
	#Gym,
#}
#
#enum BuildingAction{
	#None,
	#Place,
	#Upgrade,
	#Operate,
#}
