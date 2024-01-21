extends Entity
class_name InputMgrs

const __name : String = "in_m"
var key_input : KeyInput

func __entity_init(_args_in: VariantArgs):
	var args : Args = _args_in
	key_input = create_entity(KeyInput, KeyInput.Args.new())

class Args extends VariantArgs: pass

