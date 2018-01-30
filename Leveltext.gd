extends PopupPanel

signal enemy_spawn

func _ready():
	pop()
	get_node("Timer").start()


func _on_Timer_timeout():
	emit_signal("enemy_spawn")
	self.queue_free()

func pop():
	popup()