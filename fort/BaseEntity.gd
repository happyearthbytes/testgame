extends Object

var pub_sub : PubSub
var body_mgr : BodyMgr
var attributes : BaseAttributes
var action_mgr : BaseActionMgr
var id : ID

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func new_entity():
	pass

signal _entity_event()
func _on_entity_event():
	pass
func _on_inputHandler():
	pass
func _on_configure():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#BaseEntity <Connects> ActionManager --signals--> Attributes._on_action
#BaseEntity <Connects> ActionManager --signals--> ._on_player_event
#BaseEntity <Connects> Attributes --signals--> BodyManager._on_attribute
#
#BaseEntity [contains] 'virtual' ActionManager
