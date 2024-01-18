extends Entity
class_name UserMgr

const __name : String = "user_mgr"

enum UserType {LOCAL_USER, REMOTE_USER}
signal new_player_mgr

func __entity_init(_args_in):
	msg.subscribe_all("new_user",_on_new_user)
	msg.register("new_player_mgr",new_player_mgr)
	
func _on_new_user(args: Args):
	var user : User = create_entity(User, User.Args.new(args.user_type, args.user_name))
	msg.publish("new_player_mgr", PlayerMgr.Args.new())

class Args extends VariantArgs:
	var __name = "UserMgrArgs"
	var user_type : UserType
	var user_name : String
	func _init(user_type_in: UserType, user_name_in: String):
		user_type = user_type_in
		user_name = user_name_in
		
