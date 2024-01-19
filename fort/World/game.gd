extends Entity
class_name Game

const __name : String = "g"

var user_mgr : UserMgr
var enemy_mgr : EnemyMgr
var world_mgr : WorldMgr
var block_mgr : BlockMgr
var network_mgr : NetworkMgr
var ui_mgr : UIMgr
var input_mgr : InputMgrs
signal new_user_mgr(msg: UserMgr.Args)

func __entity_init(args_in: VariantArgs):
	user_mgr = create_entity(UserMgr, null)
	msg.register("new_user", new_user_mgr)
	msg.publish("new_user", UserMgr.Args.new(UserMgr.UserType.LOCAL_USER, "local_user"))
	
	enemy_mgr = create_entity(EnemyMgr, EnemyMgr.Args.new())
	world_mgr = create_entity(WorldMgr, WorldMgr.Args.new())
	block_mgr = create_entity(BlockMgr, BlockMgr.Args.new())
	network_mgr = create_entity(NetworkMgr, NetworkMgr.Args.new())
	ui_mgr = create_entity(UIMgr, UIMgr.Args.new())
	input_mgr = create_entity(InputMgrs, InputMgrs.Args.new())
	
class Args extends VariantArgs: pass
