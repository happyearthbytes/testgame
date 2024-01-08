extends Control

signal s_restart(enable : bool)
signal s_main_menu(enable : bool)
signal s_pause(paused : bool)
signal s_quit(paused : bool)

func connect_manager(game_manager : GameManager):
	game_manager.connect("s_pause_pressed", _on_pause_pressed)

func _ready():
	hide()

func _on_pause_pressed(paused: bool):
	if paused:
		show()
	else:
		hide()

func _process(_delta):
	pass

func _on_resume_pressed():
	emit_signal("s_pause", false)
#
func _on_quit_game_pressed():
	emit_signal("s_quit", true)

func _on_restart_pressed():
	emit_signal("s_restart", true)

func _on_main_menu_pressed():
	emit_signal("s_main_menu", true)
