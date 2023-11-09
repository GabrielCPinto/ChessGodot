extends Area2D
class_name Piece

@export var color := "Black"
@onready var anim = $anim

var active = false

func _ready():
	if color == "White":
		anim.play("idle_white")
	else:
		anim.play("idle_black")
