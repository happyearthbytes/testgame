extends Node

enum CardT {
	Debug,
	Building,
	Upgrade
}
enum CardV{
# Debug
	Toggle_Select_3,
	Toggle_Inventory,
	Add_To_Inventory,
	Delete_All_Buildings,
	# Debug Building
	Add_Barracks,
	Add_Archery_Range,
	Add_Gym,
	Select_Barracks,
	Select_Archery_Range,
	Select_Gym,
	Place_Barracks,
	Place_Archery_Range,
	Place_Gym,
	Delete_Barracks,
	Delete_Archery_Range,
	Delete_Gym,
	
# Building Action
	Select_Building,
	Add_Building,
	Place_Building,
	Delete_Building,

# Upgrade
	MoreHP,
	MoreSpeed,
}
enum Building{
	Barracks,
	Archery_Range,
	Gym,
}

