extends Node

enum CardV{
# Debug
	None,
	Toggle_Select_3,
	Toggle_Inventory,
	Delete_All_Buildings,
}

# Fields of the card
enum CardFields{
	None,
	Type,
	Action,
	Value,
	CustomFields,
}
# types of cards that can be selected
enum CardType{
	None,
	Debug,
	Event,
	Resource,
	Enhancement,
	Building,
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

enum Debug{
	None,
	Toggle_Select_3,
	Toggle_Inventory,
}
enum Events{
	None,
	Toggle_Select_3,
	Toggle_Inventory,
}

enum Resources{
	None,
	Wood,
	Stone,
}
enum Enhancements{
	None,
	MoreHP,
	MoreSpeed,
}
enum Buildings{
	None,
	Barracks,
	Archery_Range,
	Gym,
}

enum BuildingAction{
	None,
	Place,
	Upgrade,
	Operate,
}
