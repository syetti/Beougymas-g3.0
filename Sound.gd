extends Node2D
onready var Sound = get_node("SamplePlayer")
func play( sample_sound ):
	Sound.play(sample_sound)
	if sample_sound == "shooting":
		var shooting = Sound.play("shooting")
		Sound.set_pitch_scale(shooting ,rand_range(0.6, 0.8))
		
		
		
		
	
