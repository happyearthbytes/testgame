extends Object
class_name Entity

var id : ID
var base_entity_mgr : BaseEntityMgr

func _init(id_in : ID, args_in: VariantArgs):
	id = id_in
	if "__name" not in self:
		assert(false, "Need to add name")
	__entity_init(args_in)
	__base_entity_init()

func __entity_init(args_in: VariantArgs):
	assert(false, "Need to overried __entity_init")

func __entity_type():
	assert(false, "Need to overried __entity_type")
	return

func __base_entity_init():
	base_entity_mgr = BaseEntityMgr.new(__entity_type())

func create_entity(varargs: VariantArgs) -> Entity:
	return base_entity_mgr.create_entity(id.next_child(__entity_type().__name), varargs)

class Args extends VariantArgs:
	func _init():
		assert(false, "Need to overried Args")
