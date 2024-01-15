extends EntityMgr
class_name UserMgr

enum UserType {LOCAL_USER, REMOTE_USER}

func __entity_type(): # Entity
	return User

func add_user(user_type: UserType):
	create_entity(user_type)

func add_local_user():
	add_user(UserType.LOCAL_USER)
