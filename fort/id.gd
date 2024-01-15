extends Object
class_name ID

var _nextid : int = 0
var _children : Dictionary

var mgr
var inst
var id : String = "default"

func _init(mgr_in,inst_in):
	mgr=mgr_in
	inst=inst_in
	id="%s.%s" % [str(mgr_in), str(inst_in)]

func _to_string() -> String:
	return "ID(%s)" % id

func _add_child(child_in: ID):
	_children[child_in.id] = child_in

func remove_child_inst(inst_name : String):
	var child_id = "%s.%s" % [id,inst_name]
	remove_child_id_str(child_id)

func remove_child_id_str(child_in: String):
	if child_in in _children:
		_children.erase(child_in)
	else:
		printerr("unable to remove ID: ", child_in)


func remove_child_id(child_in: ID):
	remove_child_id_str(child_in.id)

func new_child(inst_in) -> ID:
	var new_child = ID.new(id,inst_in)
	_add_child(new_child)
	return new_child

func next_child(inst_name : String) -> ID:
	_nextid += 1
	return new_child("%s.%d" % [inst_name,_nextid])

func children() -> Dictionary:
	return _children
