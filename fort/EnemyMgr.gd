extends Entity
class_name EnemyMgr

const __name : String = "enemy_mgr"

func add():
	create_entity(Game, Game.Args.new())

class Args extends VariantArgs: pass

