extends EntityMgr
class_name UserMgr

var entity_mgr : BaseEntityMgr
var entity_type : Entity
var id : ID
var create_entity_cb : Callable #: funcref


func _init():
	entity_mgr = BaseEntityMgr.new(self,"create_user")

func create_user():
	return User.new()

func add_local_user():
	add_user()
	
func add_user():
	entity_mgr.create_entity()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
