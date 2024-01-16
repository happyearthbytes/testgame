extends EntityMgr
class_name PlayerMgr

const __name : String = "player_mgr"

func __entity_type():
	return Player

func add_player():
	create_entity(Player.Args.new())
