extends Node

var id : ID = ID.new("game","root")
var user_mgr : UserMgr
#var enemy_mgr : EM_EnemyMgr
#var world_mgr : EM_WorldMgr
#var block_mgr : EM_BlockMgr
#var network_mgr : NetworkMgr
#var ui_mgr : UIMgr


# Called when the node enters the scene tree for the first time.
func _ready():
	user_mgr = UserMgr.new()
	user_mgr.id = id.new_child("user_mgr")
	user_mgr.add_local_user()
	
func _process(delta):
	pass
