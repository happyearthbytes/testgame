extends Entity
class_name Player

const __name : String = "player"

func add():
	create_entity(Game, Game.Args.new())

class Args extends VariantArgs: pass

