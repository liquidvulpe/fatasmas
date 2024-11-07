@tool
extends Area2D
class_name GridArea

@export var span: int:
	set(value):
		span = value;
		queue_redraw();

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var area_size: Vector2 = Vector2(collision_shape_2d.shape.size.x, collision_shape_2d.shape.size.y)
#@onready var player = $'/root/'.find_child("fatasma", true, false)
@onready var grid =  $'/root/'.find_child("Grid", true, false)

var player: CharacterBody2D
var enemies: Array
var grid_position: Vector2
var gizmos_color: Color = Color.GREEN:
	set(value):
		gizmos_color = value;
		queue_redraw()

var isActive = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(player == null):
		return
	#print(str("Grid position: ", grid_position))
	#print(position.x + area_size.x/2 - span)
	var horizontal = null
	var vertical = null
	if(grid.size.x != grid.position.x+1):
		if(player.global_position.x > global_position.x + area_size.x/2 - span):
			#pass
			grid.grid_matrix[grid_position.x+1][grid_position.y].isActive = true
			horizontal = "direita"
			print("Direita")
		else:
			grid.grid_matrix[grid_position.x+1][grid_position.y].isActive = false
			horizontal = null
	if(grid.size.x+1 != grid.position.x):
		if(player.global_position.x < global_position.x - area_size.x/2 + span):
			#pass
			grid.grid_matrix[grid_position.x-1][grid_position.y].isActive = true
			horizontal = "esquerda"
			print("Esquerda")
		else:
			grid.grid_matrix[grid_position.x-1][grid_position.y].isActive = false
			horizontal = null
	if(grid.size.y+1 != grid.position.y):
		if(player.global_position.y < global_position.y - area_size.y/2 + span):
			grid.grid_matrix[grid_position.x][grid_position.y-1].isActive = true
			vertical = "cima"
			print("Cima")
		else:
			grid.grid_matrix[grid_position.x][grid_position.y-1].isActive = false
			vertical = null
	if(grid.size.y-1 != grid.position.y):
		if(player.global_position.y > global_position.y + area_size.y/2 - span):
			grid.grid_matrix[grid_position.x][grid_position.y+1].isActive = true
			vertical = "baixo"
			print("Baixo")
		else:
			grid.grid_matrix[grid_position.x][grid_position.y+1].isActive = false
			vertical = null
			
	if(horizontal == "direita" and vertical == "cima"):
		print("diagonal")
		if(grid.size.x-1 != grid.position.x and grid.size.y+1 != grid.position.y):
			grid.grid_matrix[grid_position.x+1][grid_position.y-1].isActive = true
	else:
		grid.grid_matrix[grid_position.x+1][grid_position.y-1].isActive = false
		
	if(horizontal == "direita" and vertical == "baixo"):
		if(grid.size.x-1 == grid.position.x and grid.size.y-1 == grid.position.y):
			grid.grid_matrix[grid_position.x+1][grid_position.y+1].isActive = true
	else:
		grid.grid_matrix[grid_position.x+1][grid_position.y+1].isActive = false
		
	if(horizontal == "esquerda" and vertical == "cima"):
		if(grid.size.x+1 == grid.position.x and grid.size.y+1 == grid.position.y):
			grid.grid_matrix[grid_position.x-1][grid_position.y-1].isActive = true
	else:
		grid.grid_matrix[grid_position.x-1][grid_position.y-1].isActive = false
		
	if(horizontal == "esquerda" and vertical == "baixo"):
		if(grid.size.x+1 == grid.position.x and grid.size.y-1 == grid.position.y):
			grid.grid_matrix[grid_position.x-1][grid_position.y+1].isActive = true
	else:
		grid.grid_matrix[grid_position.x-1][grid_position.y+1].isActive = false

func _draw() -> void:
	draw_line(Vector2(area_size.x/-2, area_size.y/-2+0.05 + span), Vector2(area_size.x/2,area_size.y/-2+0.05 + span), gizmos_color, 1)
	draw_line(Vector2(area_size.x/-2, area_size.y/2 - span), Vector2(area_size.x/2,area_size.y/2 - span), gizmos_color, 1)
	
	draw_line(Vector2(area_size.x/-2+0.05 + span, area_size.y/-2), Vector2(area_size.x/-2+0.05 + span,area_size.y/2), gizmos_color, 1)
	draw_line(Vector2(area_size.x/2+0.05 - span, area_size.y/-2), Vector2(area_size.x/2+0.05 - span,area_size.y/2), gizmos_color, 1)

func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		player = body
		isActive = true
		print(grid_position.x, ", ", grid_position.y)
	if(body.is_in_group("enemy")):
		enemies.append(body)

func _on_body_exited(body: Node2D) -> void:
	if(body.is_in_group("player")):
		player = null
		isActive = false
