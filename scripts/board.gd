extends TileMap

@onready var board = $"."

var grid_size = Vector2(8,8)
var grid := []
var pawn = preload("res://prefab/pawn.tscn")
var rook = preload("res://prefab/rook.tscn")
var knight = preload("res://prefab/knight.tscn")
var bishop = preload("res://prefab/bishop.tscn")
var queen = preload("res://prefab/queen.tscn")
var king = preload("res://prefab/king.tscn")
#var tile_size = board.get_tile_size()
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)
	
	#pawn
	for x in range(8):
		create_piece(pawn, x, 6.0, "White")

	for x in range(8):
		create_piece(pawn, x, 1.0, "Black")
	
	#rook
	for x in range(2):
		create_piece(rook, x*7, 0.0, "Black")
	
	for x in range(2):
		create_piece(rook, x*7, 7.0, "White")
		
	#knight
	create_piece(knight, 1.0, 7.0, "White")
	create_piece(knight, 6.0, 7.0, "White")
	create_piece(knight, 1.0, 0.0, "Black")
	create_piece(knight, 6.0, 0.0, "Black")
	
	#bishop
	create_piece(bishop, 2.0, 7.0, "White")
	create_piece(bishop, 5.0, 7.0, "White")
	create_piece(bishop, 2.0, 0.0, "Black")
	create_piece(bishop, 5.0, 0.0, "Black")
	
	#queen
	create_piece(queen, 3.0, 0.0, "Black")
	create_piece(queen, 3.0, 7.0, "White")
	
	#king
	create_piece(king, 4.0, 0.0, "Black")
	create_piece(king, 4.0, 7.0, "White")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_piece(piece, x, y, color):
	var new_piece = piece.instantiate()
	new_piece.color = color
	new_piece.global_position = map_to_local(Vector2(x, y))
	add_child(new_piece)
