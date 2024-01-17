extends Entity
class_name UserMgr

const __name : String = "user_mgr"

enum UserType {LOCAL_USER, REMOTE_USER}

func __entity_init(_args_in: VariantArgs):
	var args : Args = _args_in
	var user : User = create_entity(User, User.Args.new(args.user_type, args.user_name))

class Args extends VariantArgs:
	var __name = "UserMgrArgs"
	var user_type : UserType
	var user_name : String
	func _init(user_type_in: UserType, user_name_in: String):
		user_type = user_type_in
		user_name = user_name_in
		
