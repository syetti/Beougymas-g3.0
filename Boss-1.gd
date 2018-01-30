extends KinematicBody2D


export (PackedScene) var Boss_bull

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func shoot():
	var Bull = Boss_bull.instance()
	get_parent().add_child(Bull)
	