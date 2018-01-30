extends Control

signal score_changed

var score = 0 setget _set_score


func _ready():
	pass

func _set_score(new_value):
	score = new_value
	emit_signal("score_changed")
	
	if new_value == 2:
		GLOBAL.stage += 1
		get_tree().get_root().get_node("CRT/Main").level_up()
		GLOBAL.Level_up()
		get_tree().get_root().get_node("CRT/AnimationPlayer").play("CRT")
		get_tree().get_root().get_node("CRT/Main/Enemy2_timer").start()
		get_tree().get_root().get_node("CRT/Main/Enemy_timer").set_active(false)
	if new_value == 4:
		GLOBAL.stage += 1
		get_tree().get_root().get_node("/root/CRT/Main").level_up()
		GLOBAL.Level_up()
		get_node("/root/CRT//Main/Popup").pop()
		get_tree().get_root().get_node("/root/CRT/AnimationPlayer").play("CRT")
	if new_value == 6:
		DIALOUGE.level_2()
		get_tree().get_root().get_node("/root/CRT/Main/Enemy_timer").set_active(true)
		GLOBAL.stage += 1
		GLOBAL.Level_up()
