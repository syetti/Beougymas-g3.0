extends RichTextLabel

var text = ["NOW FOR A MESSAGE","FROM SLOTHE","Hey There", "That's enough for you", "And for my lazy butt", "For now...", "Wanna keep going?"]
var category = 0

func _ready():
	set_process_input(true)
	set_process(true)
	var text_plus = Timer.new()
	add_child(text_plus)
	set_text(text[category])
	set_visible_characters(0)
	text_plus.set_wait_time(.06)
	text_plus.set_autostart(true)
	text_plus.start()
	text_plus.connect("timeout", self, "TextP_one")
	
	pass

func _process(delta):
	if category == 4:
		get_parent().get_node("Yes").show()
		get_parent().get_node("No").show()


func _input(event):
	if event.is_action_pressed("ui_select"):
		if get_visible_characters() > get_total_character_count():
			if category < text.size() - 1:
				category += 1
				set_text(text[category])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
		
				


func TextP_one():
	set_visible_characters(get_visible_characters()+ 1)

func _on_Yes_pressed():
	get_tree().get_root().add_child(load("res://CRTViewportDisplay/CRT.scn").instance())
	pass
