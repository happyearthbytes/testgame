extends Node2D

class_name GameManager

#@export var pause_menu : PauseMenu
#@export var main_menu : MainMenu

@onready var pause_menu = $Game/CanvasLayer/PauseMenu
@onready var main_menu = $Game/CanvasLayer/MainMenu

signal s_restart(enable : bool)
signal s_main_menu(enable : bool)
signal s_pause_pressed(enable : bool)

############################################
## Watchers
############################################

func connect_children(game_manager : GameManager):
	pause_menu.connect_manager(game_manager)

func _ready():
	run_on_web()
	connect_children(self)

	#pause_menu.connect("s_main_menu", _on_main_menu)
	#pause_menu.connect("s_restart", _on_restart)

func _process(_delta):
	pass

func _input(event : InputEvent):
	if(event.is_action_pressed("pause")):
		toggle_pause_game()

############################################
## Signal Handlers
############################################

func _on_resume_pressed():
	unpause()

func _on_quit_game_pressed():
	get_tree().quit()

func _on_restart_pressed():
	emit_signal("s_restart", true)

func _on_main_menu_pressed():
	emit_signal("s_main_menu", true)

func _on_main_menu(enable : bool):
	main_menu.open_menu(true)

func _on_restart(enable : bool):
	pause_menu.unpause()


############################################
## Pause
############################################

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		if game_paused:
			show()
		else:
			hide()
		emit_signal("s_pause_pressed", game_paused)
		get_tree().paused = game_paused

func toggle_pause_game():
	game_paused = !game_paused

func pause():
	game_paused = true
	
func unpause():
	game_paused = false

############################################
## Check Web
############################################

func run_on_web():
	if OS.has_feature('web'):
		JavaScriptBridge.eval("console.log('Starting Godot Game for Web')")
		redirect()
	else:
		print("Starting Godot Game Locally")

func redirect():
	var direct_link = JavaScriptBridge.eval("window.location.href;")
	var main_page = JavaScriptBridge.eval("top.location.href;")
	if(direct_link != main_page):
		JavaScriptBridge.eval("alert('Visit the game at: " + direct_link + "');")
		pause_menu.pause()


