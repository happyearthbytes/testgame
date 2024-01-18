extends Entity
class_name User

const __name : String = "user"

# Creates a player Manager for your user
func __entity_init(_args_in: VariantArgs):
	var args : Args = _args_in
	var player_mgr : PlayerMgr = new_player_mgr()

func new_player_mgr():
	create_entity(PlayerMgr, PlayerMgr.Args.new())

class Args extends VariantArgs:
	const __name = "UserArgs"
	var user_type : UserMgr.UserType
	var user_name : String
	func _init(user_type_in : UserMgr.UserType, user_name_in : String):
		user_name = user_name_in
		user_type = user_type_in

