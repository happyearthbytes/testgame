extends Entity
class_name Game

var user_mgr : UserMgr
#var enemy_mgr : EM_EnemyMgr
#var world_mgr : EM_WorldMgr
#var block_mgr : EM_BlockMgr
#var network_mgr : NetworkMgr
#var ui_mgr : UIMgr

func __entity_type():
	return UserMgr

const __name : String = "game"

func __entity_init(args_in: VariantArgs):
	user_mgr = create_entity(UserMgr.Args.new())
	user_mgr.add_local_user()

class Args extends VariantArgs:
	const __name = "GameArgs"
	func _init():
		pass
