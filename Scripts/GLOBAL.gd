extends Node

onready var Slowmo = get_node("/root/CRT/Main/Slowmo")

func _ready():
	OS.set_target_fps(0)
	set_pause_mode(PAUSE_MODE_PROCESS)
	null


##################################################################
func Hit_punche():
	OS.delay_msec(2)


func Hit_punch():
	OS.delay_msec(4)
	
####################################################################

func Death():
	get_tree().set_pause(true)
	get_tree().get_root().add_child(load("res://Scenes/Gameover.tscn").instance())
	Scorechanger.score = 0
	
####################################################################
const full_time = 0.3
var activated = true

func Screenshake():
	if activated == false: return
		
	var shaking = false
	var screenshake = 0
	var time = 0
	var normal_offset = Vector2(0,0)

	var camera = get_node("/root/CRT/Main/Camera2D")
	
	if shaking: return
		shaking = true

	while time < full_time:
		time += get_fixed_process_delta_time()
		time = min(time, full_time)
		screenshake = 5.8
		var randomnessinshake = Vector2(rand_range(-0.6, 0.6)*screenshake, rand_range(-0.7, 0.7)*screenshake)
		camera.set_offset(normal_offset + randomnessinshake)
		yield(get_tree(), "idle_frame")
	camera.set_offset(normal_offset)
	screenshake = 0
	time = 0
	shaking = false

################################################################
var stage = 1
func Level_up():
	get_tree().get_root().get_node("/root/CRT/Main").level_up()
	get_node("/root/CRT/Main/Popup").pop()
	get_tree().get_root().get_node("/root/CRT/AnimationPlayer").play("CRT")
	var Level = "Level "
	var text = get_node("/root/CRT/Main/Popup/Label")
	text.set_text(str(Level, stage))
	
################################################################
func Edeath():
	activated = false
	var enemy_rem_scene = preload("res://Scenes/Enemysmoke.tscn")
	var enemy_rem = enemy_rem_scene.instance()
	var Enemy_pos = get_node("/root/CRT/Enemy").get_global_pos()
	add_child(enemy_rem)
	enemy_rem.set_global_pos(Enemy_pos)