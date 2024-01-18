extends Entity
class_name PlayerMgr

const __name : String = "player_mgr"
signal abc_sig(msg)

func __entity_init(_args_in: VariantArgs):
	msg.publish_sig("abc",abc_sig)
	msg.subscribe_all("abc",_on_abc_sig)
	msg.publish("abc","my abc message")

func _on_abc_sig(msg):
	print("got the signal")
	print(msg)

func create_player():
	return create_entity(Player, Player.Args.new())

class Args extends VariantArgs: pass

