extends Control

class_name PauseMenu

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		if game_paused:
			show()
		else:
			hide()
		get_tree().paused = game_paused

func _input(event : InputEvent):
	if(event.is_action_pressed("pause")):
		toggle_pause_game()

func toggle_pause_game():
	game_paused = !game_paused

func pause():
	game_paused = true
	
func unpause():
	game_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_resume_pressed():
	unpause()


func _on_quit_game_pressed():
	get_tree().quit()
