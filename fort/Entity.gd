extends Object
class_name Entity

var id : ID

func _init(id_in : ID, args_in: VariantArgs):
	id = id_in
	if "__name" not in self:
		assert(false, "Need to add name")
	__init(args_in)

func __init(args_in: VariantArgs):
	assert(false, "Need to overried __init")

class Args extends VariantArgs:
	func _init():
		assert(false, "Need to overried Args")
