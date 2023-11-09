extends Piece

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		active = true
		if color == "Black":
			anim.play("selected_black")
		else:
			anim.play("selected_white")
		move()

func move():
	pass
