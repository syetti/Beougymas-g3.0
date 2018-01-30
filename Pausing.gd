extends Node2D

var paused = false

func _ready():
	set_process_input(true)


func _input(event):
	var Escape = event.is_action_pressed("ui_escape")
	
	if Escape:
		paused = not paused
		if paused == true:
			get_node("../Pause").popup()
		else:
			get_node("../Pause").hide()
		get_tree().set_pause(paused)
	
