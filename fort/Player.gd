extends Entity
class_name Player

const __name : String = "player"

func __entity_init(args_in: VariantArgs):
	var args : Args = args_in

class Args extends VariantArgs:
	const __name = "PlayerArgs"

	func _init():
		pass
