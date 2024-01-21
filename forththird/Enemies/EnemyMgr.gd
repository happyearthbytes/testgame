extends Entity
class_name EnemyMgr

const __name : String = "en_m"

func add():
	create_entity(Game, Game.Args.new())

class Args extends VariantArgs: pass

