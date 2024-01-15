extends Object
class_name BaseEntityMgr

var entity_type # Entity
var pool : Array[Entity]

func _init(entity_type_in):
	entity_type = entity_type_in

func create_entity(varargs: Variant):
	var new_entity : Entity = entity_type.new(varargs)
	pool.append(new_entity)
