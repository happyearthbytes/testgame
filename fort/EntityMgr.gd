extends Entity
class_name EntityMgr

var base_entity_mgr : BaseEntityMgr

func __entity_init(args_in: VariantArgs):
	var args : Args = args_in
	base_entity_mgr = BaseEntityMgr.new(__entity_type())

func __entity_type():
	assert(false, "Need to overried __entity_type")
	return

func create_entity(varargs: VariantArgs) -> Entity:
	return base_entity_mgr.create_entity(id.next_child(__entity_type().__name), varargs)

class Args extends VariantArgs:
	const __name = "EntityMgr"
	func _init():
		pass

