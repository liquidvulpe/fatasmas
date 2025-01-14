extends CharacterBody2D
class_name EnemyBT

@onready var player = $'/root/'.find_child("fatasma", true, false)
@onready var area_2d: Area2D = $Area2D
@onready var attack_cooldown: Timer = $AttackCooldown
@onready var behavior_tree_root: BehaviorTreeRoot = $BehaviorTreeRoot
@onready var timer = $Timer

const MAX_SPEED: int = 70
const MAX_STEERING: float = 2.5
const AVOID_FORCE: int = 1000

const ARRIVAL_ZONE_RADIUS: int = 20

var curr_area
var new_area

var max_life = 30
var life = max_life
var atk_power = 10

var can_attack: bool = false
var is_stunned: bool = false
var is_attacked: bool = false

func set_enemy_velocity(steering: Vector2):
	velocity += steering
	velocity = velocity.limit_length(MAX_SPEED)
	move_and_slide()

func attacked() -> void:
	is_attacked = true

func _on_area_2d_area_entered(area):
	if(area.is_in_group("area")):
		if(behavior_tree_root.blackboard._get('curr_area') == null):
			behavior_tree_root.blackboard._set('curr_area', area)
			curr_area = area
		else:
			behavior_tree_root.blackboard._set('new_area', area)
			new_area = area

func _on_area_2d_area_exited(area: Area2D) -> void:
	if(area.is_in_group("area") && area == behavior_tree_root.blackboard._get('curr_area')):
		behavior_tree_root.blackboard._set('curr_area', new_area)
		curr_area = new_area

func _on_area_2d_body_entered(body):
	if(body.is_in_group("player")):
		can_attack = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.is_in_group("player")):
		can_attack = false


func _on_timer_timeout() -> void:
	is_stunned = false
