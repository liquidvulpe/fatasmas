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
	pass

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
