@tool
extends Node2D
class_name grid

@export var size: Vector2 = Vector2(0,0):
	set(value):
		size = value;
		queue_redraw()

@export var cell_size: int = 16:
	set(value):
		cell_size = value;
		queue_redraw()

@export var scene: Resource = preload("res://scenes/area.tscn")

var grid_matrix = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in size.x:
		grid_matrix.append([])
		for j in size.y:
			grid_matrix[i].append(null)
	
	for i in size.x:
		for j in size.y:
			var instance: GridArea = scene.instantiate()
			add_child(instance)
			instance.global_position = Vector2(cell_size * i + cell_size/2, cell_size * j + cell_size/2)
			grid_matrix[i][j] = instance
			instance.grid_position = Vector2(i,j)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	for i in size.x:
		for j in size.y:
			draw_rect(Rect2(Vector2((global_position.x + cell_size) * i, (global_position.y + cell_size) * j), Vector2(cell_size,cell_size)), Color(Color.RED, 0.2), true)
			
			draw_line(Vector2(cell_size*i, cell_size*j+0.5),Vector2(cell_size*i + cell_size, cell_size*j+0.5), Color.RED, 1)
			draw_line(Vector2(cell_size*i, cell_size*j+cell_size-0.5),Vector2(cell_size*i + cell_size, cell_size*j+cell_size-0.5), Color.RED, 1)
			
			draw_line(Vector2(cell_size*i+0.5, cell_size*j),Vector2(cell_size*i+0.5, cell_size*j+cell_size), Color.RED, 1)
			draw_line(Vector2(cell_size*i-0.5+cell_size, cell_size*j),Vector2(cell_size*i-0.5+cell_size, cell_size*j+0.5+cell_size), Color.RED, 1)

func get_cell(x, y):
	return grid_matrix[x][y]
