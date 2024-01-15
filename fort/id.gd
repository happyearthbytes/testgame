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

func remove_child_id(child_in: String):
	if child_in in _children:
		print("removing")
		print(child_in)

func remove_child(child_in: ID):
	remove_child_id(child_in.id)

func new_child(inst_in) -> ID:
	var new_child = ID.new(mgr,inst_in)
	_add_child(new_child)
	return new_child

func next_child() -> ID:
	_nextid += 1
	return new_child(_nextid)

func children() -> Dictionary:
	return _children
