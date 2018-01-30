extends KinematicBody2D

var can_shoot = true
export (PackedScene) var bullet_
var Velocity = Vector2()
var Speed = 800
onready var Health = get_node("../Health/Healthb1")
var health = 100 
onready var Time = get_node("shootingdelay")
signal score_changed_0
onready var Muzzle_flash = get_node("Muzzle_Flash")

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	
func _input(event):
	#var Move_Right = event.is_action_pressed("ui_right")
	#var Move_Left = event.is_action_pressed("ui_left")
	#var stop_moving_x = not Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left")
	var Move_Down = event.is_action_pressed("ui_down")
	var Move_Up = event.is_action_pressed("ui_up")
	var stop_moving_y = not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down")

		
	if Move_Down:
		Velocity.y = Speed
	elif Move_Up:
		Velocity.y = -Speed
	elif stop_moving_y:
		Velocity.y = 0
		
	
func _fixed_process(delta):	
	var motion = Velocity * delta
	motion = move(motion)
	var click = Input.is_action_pressed("ui_select")and can_shoot	
	if click:
		Time.start()
		fire()
	if health <= 0:
		GLOBAL.Death()
		
	
	Health.set_value(health)
	

func _on_Timer_timeout():
	if not is_colliding():
		Health.hide()
		
func fire():
	get_node("Muzzle_Flash/Muzzle_time").start()
	get_node("Muzzle_Flash/Flash").play("Flash")
	Muzzle_flash.show()
	Muzzle_flash.set_pos(Vector2(55,rand_range(-7,7)))
	var bullet = bullet_.instance()
	get_parent().add_child(bullet)
	bullet.set_global_pos(get_node("Bulletspawn").get_global_pos())
	Sound.play("shooting")
	can_shoot = false


func _on_Area2D_area_enter( area ):
	if area.is_in_group("Wall"):
		Velocity.y = 0
	if area.is_in_group("Enemybull"):
		GLOBAL.Hit_punch()
		Time.start()
		Health.show()
		health -=  20

func _on_Area2D_area_exit( area ):
	if area.is_in_group("Wall"):
		Velocity = true 

func _on_Timer_2_timeout():
	can_shoot = true


func _on_Muzzle_time_timeout():
	get_node("Muzzle_Flash").hide()
