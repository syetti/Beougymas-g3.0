extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_TextureButton_pressed():
	var s = ResourceLoader.load("res://Scenes/Main")
	get_tree().get_root().add_child(s)