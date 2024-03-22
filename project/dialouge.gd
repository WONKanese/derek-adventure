extends TextureRect

var dialouge_queue = []
var dialouge_name = ""
var dia_i = 0

func ended():
	if dialouge_name == "Grandma":
		Global.quest = 1
	elif dialouge_name == "Finish":
		get_tree().change_scene_to_file("res://Win.tscn")
	dialouge_name = ""

func _process(delta):
	if Input.is_action_just_pressed("Next"):
		dia_i += 1
		if dia_i >= dialouge_queue.size():
			visible = false
			ended()
		else:
			$Text.text = dialouge_queue[dia_i]
	elif Input.is_action_just_pressed("Last"):
		dia_i -= 1
		if dia_i <= -1:
			dia_i = 0
		else:
			$Text.text = dialouge_queue[dia_i]
			
func show_dialouge(dname, texts):
	dialouge_name = dname
	var text_display = $Text
	dialouge_queue = texts
	visible = true
	
	text_display.text = dialouge_queue[0]
	
	
