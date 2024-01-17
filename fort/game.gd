extends Entity
class_name Game

const __name : String = "game"

var user_mgr : UserMgr
var enemy_mgr : EnemyMgr
var world_mgr : WorldMgr
var block_mgr : BlockMgr
var network_mgr : NetworkMgr
var ui_mgr : UIMgr



func __entity_init(args_in: VariantArgs):
	user_mgr = create_entity(UserMgr, UserMgr.Args.new())
	user_mgr.add_local_user()
	enemy_mgr = create_entity(EnemyMgr, EnemyMgr.Args.new())
	world_mgr = create_entity(WorldMgr, WorldMgr.Args.new())
	block_mgr = create_entity(BlockMgr, BlockMgr.Args.new())
	network_mgr = create_entity(NetworkMgr, NetworkMgr.Args.new())	
	ui_mgr = create_entity(UIMgr, UIMgr.Args.new())	

class Args extends VariantArgs: pass
