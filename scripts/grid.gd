extends Node2D
class_name grid

@export var size: Vector2 = Vector2(3,3):
	set(value):
		size = value;
		queue_redraw()

@export var cell_size: int = 160:
	set(value):
		cell_size = value;
		queue_redraw()

@export var scene: Resource = preload("res://scenes/area.tscn")
@onready var player: Player = $"../fatasma"

var grid_matrix = []

var main_scene: GridArea
var horizontal: String = ""
var vertical: String = ""
var custom_debug: bool = false

var enemies: Array

func _input(event):
	if (event.is_action_pressed("debug")):
		custom_debug = true if !custom_debug else false
		queue_redraw()

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
	enemies = get_tree().get_nodes_in_group("enemy")
	if(enemies.size() == 0):
		get_tree().change_scene_to_file("res://scenes/vitoria.tscn")
	
	if(player == null):
		return
	
	var curr_area: GridArea = player.curr_area
	if(player.curr_area == null):
		return
	
	var area_size: Vector2 = player.curr_area.area_size
	var span: int = player.curr_area.span
	
	var isFirstCol = curr_area.grid_position.x == 0
	var isLastCol = curr_area.grid_position.x == size.x-1
	var isFirstRow = curr_area.grid_position.y == 0
	var isLastRow = curr_area.grid_position.y == size.y-1
		
	if(!isLastCol):
		pass
		
	if(player.global_position.x < curr_area.global_position.x - area_size.x/2 + span):
		horizontal = "esquerda"
		if(!isFirstCol): grid_matrix[curr_area.grid_position.x-1][curr_area.grid_position.y].isActive = true
		if(!isLastCol): grid_matrix[curr_area.grid_position.x+1][curr_area.grid_position.y].isActive = false
	elif(player.global_position.x > curr_area.global_position.x + area_size.x/2 - span):
		horizontal = "direita"
		if(!isFirstCol): grid_matrix[curr_area.grid_position.x-1][curr_area.grid_position.y].isActive = false
		if(!isLastCol): grid_matrix[curr_area.grid_position.x+1][curr_area.grid_position.y].isActive = true
	else:
		horizontal = ""
		if(!isFirstCol): grid_matrix[curr_area.grid_position.x-1][curr_area.grid_position.y].isActive = false
		if(!isLastCol): grid_matrix[curr_area.grid_position.x+1][curr_area.grid_position.y].isActive = false

	if(player.global_position.y < curr_area.global_position.y - area_size.y/2 + span):
		vertical = "cima"
		if(!isFirstRow): grid_matrix[curr_area.grid_position.x][curr_area.grid_position.y-1].isActive = true
		if(!isLastRow): grid_matrix[curr_area.grid_position.x][curr_area.grid_position.y+1].isActive = false
	elif(player.global_position.y > curr_area.global_position.y + area_size.y/2 - span):
		vertical = "baixo"
		if(!isFirstRow): grid_matrix[curr_area.grid_position.x][curr_area.grid_position.y-1].isActive = false
		if(!isLastRow): grid_matrix[curr_area.grid_position.x][curr_area.grid_position.y+1].isActive = true
	else:
		vertical = ""
		if(!isFirstRow): grid_matrix[curr_area.grid_position.x][curr_area.grid_position.y-1].isActive = false
		if(!isLastRow): grid_matrix[curr_area.grid_position.x][curr_area.grid_position.y+1].isActive = false
	
	# Diagonais
	if(!isLastCol && !isFirstRow):
		if(horizontal == "direita" && vertical == "cima"):
			grid_matrix[curr_area.grid_position.x+1][curr_area.grid_position.y-1].isActive = true
		else:
			grid_matrix[curr_area.grid_position.x+1][curr_area.grid_position.y-1].isActive = false
	
	if(!isLastCol && !isLastRow):
		if(horizontal == "direita" && vertical == "baixo"):
			grid_matrix[curr_area.grid_position.x+1][curr_area.grid_position.y+1].isActive = true
		else:
			grid_matrix[curr_area.grid_position.x+1][curr_area.grid_position.y+1].isActive = false
	
	if(!isFirstCol && !isFirstRow):
		if(horizontal == "esquerda" && vertical == "cima"):
			grid_matrix[curr_area.grid_position.x-1][curr_area.grid_position.y-1].isActive = true
		else:
			grid_matrix[curr_area.grid_position.x-1][curr_area.grid_position.y-1].isActive = false
	
	if(!isFirstCol && !isLastRow):
		if(horizontal == "esquerda" && vertical == "baixo"):
			grid_matrix[curr_area.grid_position.x-1][curr_area.grid_position.y+1].isActive = true
		else:
			grid_matrix[curr_area.grid_position.x-1][curr_area.grid_position.y+1].isActive = false
	

	#print(horizontal)
	#print(vertical)

func _draw() -> void:
	if(custom_debug):
		for i in size.x:
			for j in size.y:
				draw_rect(Rect2(Vector2((global_position.x + cell_size) * i, (global_position.y + cell_size) * j), Vector2(cell_size,cell_size)), Color(Color.RED, 0.2), true)
				
				draw_line(Vector2(cell_size*i, cell_size*j+0.5),Vector2(cell_size*i + cell_size, cell_size*j+0.5), Color.RED, 1)
				draw_line(Vector2(cell_size*i, cell_size*j+cell_size-0.5),Vector2(cell_size*i + cell_size, cell_size*j+cell_size-0.5), Color.RED, 1)
				
				draw_line(Vector2(cell_size*i+0.5, cell_size*j),Vector2(cell_size*i+0.5, cell_size*j+cell_size), Color.RED, 1)
				draw_line(Vector2(cell_size*i-0.5+cell_size, cell_size*j),Vector2(cell_size*i-0.5+cell_size, cell_size*j+0.5+cell_size), Color.RED, 1)

func get_cell(x, y):
	return grid_matrix[x][y]
