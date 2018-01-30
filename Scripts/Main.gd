extends Node2D
var Enemy = preload("res:///Scenes/Enemy.tscn")
var Enemy2 = preload("res://Scenes/Enemy-2.tscn")
var Leveltext = preload("res://Scenes/Leveltext.tscn")
onready var spawn_ = get_node("Spaw_enemy")
onready var spawn_2 = get_node("Spaw_enemy2")
onready var spawn_place = spawn_.get_global_pos()
onready var spawn_place2 =spawn_2.get_global_pos()
signal Enemyenter




func level_up():
	var level_popup = Leveltext.instance()
	add_child(level_popup)
	
func spawn_E1():
	var Enemyy = Enemy.instance()
	get_parent().add_child(Enemyy)
	Enemyy.set_global_pos(spawn_place)
	emit_signal("Enemyenter")
	
func spawn_E2():
	var Enemyy = Enemy2.instance()
	get_parent().add_child(Enemyy)
	Enemyy.set_global_pos(spawn_place2)

func _on_Enemy_timer_timeout():
	spawn_E1()

func _on_Enemy2_timer_timeout():
	spawn_E2()
