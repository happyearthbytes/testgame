extends Entity
class_name BlockMgr

const __name : String = "bl_m"

func __entity_init(args_in: VariantArgs):
	pass

func add():
	create_entity(Game, Game.Args.new())

class Args extends VariantArgs: pass

