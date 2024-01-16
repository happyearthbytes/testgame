extends Entity
class_name Player

const __name : String = "player"

func __entity_init(args_in: VariantArgs):
	var args : Args = args_in
func __entity_type():
	return

class Args extends VariantArgs:
	const __name = "PlayerArgs"

	func _init():
		pass

