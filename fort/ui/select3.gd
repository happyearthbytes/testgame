extends Control

@onready var content = $MarginContainer
var toggle_state : bool = true

func _ready():
	Sig.event.connect(handle_event)

func handle_event(ev: Types.Event):
	if ev.ui.type == Types.UI.Toggle_Select_3:
		toggle()
	if ev.type == Types.EventType.CardChoice:
		print(ev)

func toggle():
	toggle_state = !toggle_state
	if toggle_state:
		content.show()
	else:
		content.hide()

