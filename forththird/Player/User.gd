extends Entity
class_name User

const __name : String = "usr"
var player_mgr : PlayerMgr

signal new_player

# Creates a player Manager for your user
func __entity_init(_args_in: VariantArgs):
	var args : Args = _args_in
	msg.subscribe_all("new_player_mgr",_on_new_player_mgr)
	msg.register("new_player",new_player)
	
func _on_new_player_mgr(_args_in: VariantArgs):
	player_mgr = create_entity(PlayerMgr, PlayerMgr.Args.new())
	msg.publish("new_player", PlayerMgr.Args.new())

class Args extends VariantArgs:
	const __name = "UserArgs"
	var user_type : UserMgr.UserType
	var user_name : String
	func _init(user_type_in : UserMgr.UserType, user_name_in : String):
		user_name = user_name_in
		user_type = user_type_in

