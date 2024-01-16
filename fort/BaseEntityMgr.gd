extends Object
class_name BaseEntityMgr

var entity_type # Entity
var pool : Array[Entity]

func _init(entity_type_in):
	entity_type = entity_type_in

func create_entity(id: ID, varargs: VariantArgs):
	var new_entity : Entity = entity_type.new(id, varargs)
	pool.append(new_entity)
