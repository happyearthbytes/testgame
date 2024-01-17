extends Entity
class_name NetworkMgr

const __name : String = "net_mgr"

func __entity_init(args_in: VariantArgs):
	pass

func add():
	create_entity(Game, Game.Args.new())

class Args extends VariantArgs: pass

