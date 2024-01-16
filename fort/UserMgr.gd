extends EntityMgr
class_name UserMgr

enum UserType {LOCAL_USER, REMOTE_USER}

func __entity_type():
	return User

func add_user(user_type: UserType, user_name: String):
	create_entity(User.Args.new(user_type, user_name))
	create_entity(User.Args.new(user_type, "user_namefdasfd"))

func add_local_user():
	add_user(UserType.LOCAL_USER, "local_user")