extends Control

@onready var content = $MarginContainer
var toggle_state : bool = true

func _ready():
	Sig.event.connect(handle_event)

func handle_event(event: Types.Event):
	if event.ui.type == Types.UI.Toggle_Inventory:
		toggle()

func toggle():
	toggle_state = !toggle_state
	if toggle_state:
		content.show()
	else:
		content.hide()
