extends Node
class_name Root

var id : ID = ID.new("x","root")
var game : Game
#var enemy_mgr : EM_EnemyMgr
#var world_mgr : EM_WorldMgr
#var block_mgr : EM_BlockMgr
#var network_mgr : NetworkMgr
#var ui_mgr : UIMgr

func _ready():
	game = Game.new(id,Args.new())

class Args extends VariantArgs:
	const __name = "GameArgs"
	func _init():
		pass
