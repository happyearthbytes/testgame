extends Entity
class_name User

const __name : String = "user"

func __entity_init(args_in: VariantArgs):
	var args : Args = args_in

class Args extends VariantArgs:
	const __name = "UserArgs"

	var user_type : UserMgr.UserType
	var user_name : String

	func _init(user_type_in : UserMgr.UserType, user_name_in : String):
		user_name = user_name_in
		user_type = user_type_in
