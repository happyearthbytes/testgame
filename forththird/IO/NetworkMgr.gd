extends Entity
class_name NetworkMgr

const __name : String = "nt_m"
#signal player_reset

func __entity_init(_args_in: VariantArgs):
	var args : Args = _args_in
	#msg.subscribe_all("new_player",_on_new_player)
	#msg.register("player_reset", player_reset)

#func _on_new_player(args: Args):
	#var player : Player = create_entity(Player, Player.Args.new())
	#msg.publish("player_reset", Player.Args.new())

class Args extends VariantArgs: pass

