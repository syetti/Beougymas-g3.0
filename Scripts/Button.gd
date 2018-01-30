extends Button

func _ready():
	
	pass


func _on_Button_pressed():
	get_tree().set_pause(false)
	get_tree().reload_current_scene()
	self.get_parent().queue_free()
	
