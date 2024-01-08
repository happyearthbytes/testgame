extends Control

func open_menu(enable: bool):
	if enable:
		show()
	else:
		hide()

func _ready():
	hide()

func _process(_delta):
	pass
