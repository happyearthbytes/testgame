extends Entity
class_name UIMgr

const __name : String = "ui_mgr"

func __entity_init(args_in: VariantArgs):
	pass

func add():
	create_entity(Game, Game.Args.new())

class Args extends VariantArgs: pass

