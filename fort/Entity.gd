extends Object
class_name Entity

var id : ID
var entity_type # Entity
var pool : Array[Entity]
# var __main : String = "entity_name"

func _init(id_in : ID, args_in: VariantArgs):
	id = id_in
	if "__name" not in self:
		assert(false, "Need to add name")
	entity_type = __entity_type()
	__entity_init(args_in)


func __entity_init(_args_in: VariantArgs):
	assert(false, "Need to overried __entity_init")

func __entity_type():
	assert(false, "Need to overried __entity_type")
	return

func create_entity(varargs: VariantArgs) -> Entity:
	var new_entity : Entity = entity_type.new(id.next_child(__entity_type().__name), varargs)
	pool.append(new_entity)
	return new_entity
	
class Args extends VariantArgs:
	func _init():
		assert(false, "Need to overried Args")
