extends Entity
class_name BodyMgr

const __name : String = "body_mgr"

func __entity_init(args_in: VariantArgs):
	pass

func add():
	create_entity(Game, Game.Args.new())

class Args extends VariantArgs: pass

