extends Entity
class_name Player

const __name : String = "pl"
var player = preload("res://Player/player.tscn")

func __entity_init(_args_in: VariantArgs):
	var args : Args = _args_in
	msg.subscribe_all("player_reset",_on_player_reset)

func _on_player_reset(args: Args):
	var new_player = player.instantiate()
	add_child(new_player)

class Args extends VariantArgs: pass

