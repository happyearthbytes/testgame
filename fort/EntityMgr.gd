extends Object
class_name EntityMgr

var base_entity_mgr : BaseEntityMgr
var id : ID

func _init(id_in : ID):
	id = id_in
	base_entity_mgr = BaseEntityMgr.new(__entity_type())

func __entity_type():
	assert(false, "Need to overried __entity_type")
	return

func create_entity(varargs: VariantArgs) -> Entity:
	return base_entity_mgr.create_entity(id.next_child(__entity_type().__name), varargs)
