extends Area2D
class_name Piece

@export var color := "Black"
@onready var anim = $anim

var pos
var selected = false

func _ready():
	if color == "White":
		anim.play("idle_white")
	else:
		anim.play("idle_black")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and !Global.active:
		Global.active = true
		print(anim.animation)
		if color == "Black":
			anim.play("selected_black")
		else:
			anim.play("selected_white")
	elif event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT and Global.active and (anim.animation == "selected_black" or anim.animation == "selected_white"):
		Global.active = false
		
		if color == "Black":
			anim.play("idle_black")
		else:
			anim.play("idle_white")
		
		
func select():
	pass
