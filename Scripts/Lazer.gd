extends Node2D

onready var lazer_root = get_node("Lazer")

var lazer_width = 120
onready var lazer_tex = get_node("Lazer/Sprite")

func _process(dt):
	var targetpos = get_node("Lazer/Base")
	var raycast = get_node("Lazer")
	if raycast.is_colliding():
		targetpos = raycast.get_collision_point()
	else:
		targetpos = get_node("Lazer/TArget").get_global_pos()
	var length = (targetpos - lazer_root.get_global_pos()).length()	
	lazer_tex.set_size(Vector2( length, lazer_width))
func _ready():
	pass
	
	
func _input(event):
	if event.is_action_pressed("ui_select"):
		lazer_root.show()
		set_process(true)
	elif event.is_action_released("ui_select"):
		lazer_root.hide()
		set_process(false)

func _on_Timer_timeout():
	set_process_input(true)
