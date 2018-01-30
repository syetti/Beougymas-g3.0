extends Control

onready var textt = get_node("Label")

var x = "x"
func _ready():
	textt.set_text(str(x, Scorechanger.score))
	Scorechanger.connect("score_changed", self, "_current_score")


func _current_score():
	textt.set_text(str(x, Scorechanger.score))
	
	
