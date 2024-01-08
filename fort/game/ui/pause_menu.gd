extends Control
#
#class_name PauseMenu
#
#signal s_restart(enable : bool)
#signal s_main_menu(enable : bool)
#signal s_pause(enable : bool)

#var game_paused : bool = false:
	#get:
		#return game_paused
	#set(value):
		#game_paused = value
		#if game_paused:
			#show()
		#else:
			#hide()
		#emit_signal("s_pause", game_paused)
		#get_tree().paused = game_paused
#
#func _input(event : InputEvent):
	#if(event.is_action_pressed("pause")):
		#toggle_pause_game()
#
#func toggle_pause_game():
	#game_paused = !game_paused
#
#func pause():
	#game_paused = true
	#
#func unpause():
	#game_paused = false
#
## Called when the node enters the scene tree for the first time.

func connect_manager(game_manager : GameManager):
	#var game_manager : GameManager = get_node("/Root/GameManager")
	game_manager.connect("s_pause_pressed", _on_pause_pressed)

func _ready():
	hide()

func _on_pause_pressed(paused: bool):
	print(paused)	
	if paused:
		show()
	else:
		hide()
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
	#pass
#
#
#func _on_resume_pressed():
	#unpause()
#
#func _on_quit_game_pressed():
	#get_tree().quit()
#
#func _on_restart_pressed():
	#emit_signal("s_restart", true)
#
#func _on_main_menu_pressed():
	#emit_signal("s_main_menu", true)
