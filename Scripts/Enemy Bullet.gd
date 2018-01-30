extends KinematicBody2D

var RUN_SPEED = 1000
var velocity = Vector2(-RUN_SPEED, 0)

func _ready():
	set_process(true)

func _process(delta):
	var motion = velocity * delta
	move(motion)
	
	
func _on_Area2D_body_enter( body ):
	if body.is_in_group("EBullet_death"):
			queue_free()
	




func _on_Area2D_area_enter( area ):
		if area.is_in_group("MC"):
			queue_free()