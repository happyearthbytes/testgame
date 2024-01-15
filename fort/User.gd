extends Entity
class_name User

func _init(user_type: UserMgr.UserType):
	print("Creating User %s" % [UserMgr.UserType.find_key(user_type)])

