extends Object
class_name Entity

var id : ID

func _init(id_in : ID, args_in: VariantArgs):
	id = id_in
	if "__name" not in self:
		assert(false, "Need to add name")
	__entity_init(args_in)

func __entity_init(args_in: VariantArgs):
	assert(false, "Need to overried __entity_init")

class Args extends VariantArgs:
	func _init():
		assert(false, "Need to overried Args")
