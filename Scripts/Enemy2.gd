extends KinematicBody2D

export (PackedScene) var Enemy_bullet

onready var Red = get_node("Red Flash")
onready var anim = get_node("Anim1")

var health = 100


func _ready():
	set_fixed_process(true)
	

func _fixed_process(delta):

		
	if health <= 0:
		get_tree().get_root().get_node("CRT/Main/Enemy_timer").start()
		Scorechanger.score += 1
		queue_free()

		


func _on_Timer_timeout():
	var Enemybull = Enemy_bullet.instance()
	get_parent().add_child(Enemybull)
	Enemybull.set_global_pos(get_node("Enemybulspawn").get_global_pos())



func _on_Area2D_area_enter( area ):
	if area.is_in_group("Bullet"):
		GLOBAL.Screenshake()
		area.get_parent().get_node("AnimationPlayer").play("Bullexplode")
		anim.play("Red_Flash")
		health -= 25
		


