extends Control

@onready var content = $MarginContainer
var toggle_state : bool = true

func _ready():
	Sig.event.connect(handle_event)

func handle_event(ev: Types.Event):
	if ev.type == Types.Event.T.UI:
		if ev.ui.type == Types.UI.T.Toggle_Select_3:
			toggle()
	if ev.type == Types.Event.T.CardChoice:
		print(ev)

func toggle():
	toggle_state = !toggle_state
	if toggle_state:
		content.show()
	else:
		content.hide()

