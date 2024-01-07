extends Node

class_name GameManager

#@export var pause_menu : PauseMenu
#@export var main_menu : MainMenu

#@onready var pause_menu = $CanvasLayer/PauseMenu
#@onready var main_menu = $CanvasLayer/MainMenu

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
		#pause_menu.pause()

#func _on_main_menu(enable : bool):
	#main_menu.open_menu(true)
#
#func _on_restart(enable : bool):
	#pause_menu.unpause()

func _ready():
	run_on_web()
	#pause_menu.connect("s_main_menu", _on_main_menu)
	#pause_menu.connect("s_restart", _on_restart)

func _process(_delta):
	pass
