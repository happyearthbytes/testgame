extends Entity
class_name Player

const __name : String = "player"

func __entity_init(_args_in: VariantArgs):
	var args : Args = _args_in
	msg.subscribe_all("player_reset",_on_player_reset)
	#msg.register("player_reset", player_reset)

func _on_player_reset(args: Args):
	print("I am resetted")
	#msg.publish("player_reset", Player.Args.new())

class Args extends VariantArgs: pass

