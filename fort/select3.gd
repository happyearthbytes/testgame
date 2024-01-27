extends Control

@onready var content = $CenterContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	Sig.select3.connect(on_select3)


func on_select3(show: bool):
	if show:
		content.show()
	else:
		content.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
