extends Node2D
onready var tween = get_node("Tween")
func _ready():
	tween.interpolate_property(self, "transform/pos", get_pos(), Vector2(0,0), 1, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	tween.start()
	set_pause_mode(PAUSE_MODE_PROCESS)
	pass


