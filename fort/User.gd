extends Entity
class_name User



func __entity_arg_type(): # Entity
	return UserArgs

func __init(vargs: VariantArgs):
	var argval : UserArgs = vargs as UserArgs
	print(argval)
	
class UserArgs extends VariantArgs:
	var __name = "UserArgs"
	var user_type : UserMgr.UserType
	var user_name : String

	func __set_args(args: Array[Variant]):
		user_type = args[0]
		user_name = args[1]

