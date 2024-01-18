extends Entity
class_name PlayerMgr

const __name : String = "player_mgr"

func add_player():
	create_entity(Player, Player.Args.new())

class Args extends VariantArgs: pass

