extends Node2D

class_name GameManager

@export var pause_menu : PauseMenu

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
	
func _ready():
	run_on_web()

func _process(_delta):
	pass
