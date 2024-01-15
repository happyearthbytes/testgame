extends Object
class_name BaseEntityMgr

var entity_pool : EntityPool
var create_entity_cb : Callable


func _init(obj_ref, create_entity_cb_name):
	register_create_entity(obj_ref,"create_user")

func register_create_entity(obj_ref, create_entity_cb_name):
	create_entity_cb = Callable(obj_ref, create_entity_cb_name)

func create_entity():
	create_entity_cb.call()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
