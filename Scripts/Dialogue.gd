extends RichTextLabel

var stay = true
var page = 0
var text = ["Alright", "annual tests begin", "Deploy the Cryobots","Upgrading difficulty","Good job","Go as long as you want","I'll see you later"]
func _ready():
	set_fixed_process(true)
	push_align(ALIGN_CENTER)
	set_visible_characters(0)
	set_text(text[page])
	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+ 1)


func _on_text_stay_timeout():
	if page < text.size() - 1:
		page += 1
		set_text(text[page])
		set_visible_characters(0)
	
func level_2():
	page = 3
	set_text(text[page])
	get_node("text_stay").start()

func fixed_process(delta):
	if page == 2:
		get_node("text_stay").stop()

