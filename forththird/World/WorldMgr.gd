extends Entity
class_name WorldMgr

const __name : String = "wd_m"

func __entity_init(args_in: VariantArgs):
	pass

func add():
	create_entity(Game, Game.Args.new())

class Args extends VariantArgs: pass

