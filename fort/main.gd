extends Node2D


func pause():
	get_tree().paused = true
	#show()
	#hide()

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
		pause()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE
	run_on_web()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
