extends Entity
class_name PlayerMgr

const __name : String = "player_mgr"

func __entity_type():
	return Player

func add_player():
	create_entity(Player.Args.new())

func __entity_init(args_in: VariantArgs):
	pass

class Args extends VariantArgs:
	func _init():
		pass
