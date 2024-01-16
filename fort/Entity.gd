extends Object
class_name Entity

var args : VariantArgs

func _init(varargs: Array[Variant]):
	var args_type = __entity_arg_type()
	args = _unpack_args(varargs, args_type)
	__init(args)

func _unpack_args(args: Array[Variant], args_type) -> VariantArgs:
	return args_type.new(args)
	
func __init(varargs: VariantArgs):
	assert(false, "Need to overried __init")



func __entity_arg_type(): # VariantArgs
	assert(false, "Need to overried __entity_arg_type")
	return

