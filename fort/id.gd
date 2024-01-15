extends Object
class_name ID

var _next_inst_n : Dictionary # name to next_inst_n
var _children : Dictionary

const DEFAULT_INST : String = ""
const DEFAULT_NAME : String = "default_name"

@export var id_name : String = DEFAULT_NAME
var mgr : String
var inst : String
var id : String

func _init(mgr_in: String="root",name_in: String="default_name_in",inst_in: String=DEFAULT_INST):
	mgr=mgr_in
	id_name=name_in
	inst=inst_in
	var name_inst = _name_inst_to_str(id_name,inst)
	id="%s.%s" % [str(mgr_in), str(name_inst)]

func _name_inst_to_str(name_in: String, inst_in: String = DEFAULT_INST) -> String:
	var name_inst : String
	if inst_in == DEFAULT_INST:
		name_inst = id_name
	else:
		name_inst = "%s-%s" %[name_in,inst_in]
	return name_inst

func _to_string() -> String:
	return "ID(%s)" % id

func _add_child(child_in: ID):
	if child_in.id in _children:
		assert(false,"Child ID already added: %s" % child_in);
	_children[child_in.id] = child_in

func remove_child_by_name(name_in: String, inst_in: String = DEFAULT_INST):
	var name_inst = _name_inst_to_str(name_in,inst_in)
	var child_id = "%s.%s" % [id,name_inst]
	remove_child_by_id_str(child_id)

func remove_child_by_id_str(child_in: String):
	if child_in in _children:
		_children.erase(child_in)
	else:
		printerr("unable to remove ID: ", child_in)

func remove_child_by_id(child_in: ID):
	remove_child_by_id_str(child_in.id)

func new_child(name_in: String, inst_in: String = DEFAULT_INST) -> ID:
	var new_child = ID.new(id,name_in,inst_in)
	print("New ID: %s -> %s" % [self, new_child])
	_add_child(new_child)
	return new_child
	
func next_child(name_in: String) -> ID:
	var next_inst = _next_inst_n.get(name_in,0)
	next_inst += 1
	_next_inst_n[name_in] = next_inst
	return new_child(name_in,str(next_inst))

func children() -> Dictionary:
	return _children
