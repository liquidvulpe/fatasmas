extends CharacterBody2D
class_name EnemyBTTest

@onready var player = $'/root/'.find_child("fatasma", true, false)
@onready var area_2d: Area2D = $Area2D
@onready var attack_cooldown: Timer = $AttackCooldown

var target
const SPEED = 0.75
var curr_area
var new_area
var areas: Array

var max_life = 30
var life = max_life
var atk_power = 10

var can_attack: bool = false

func start() -> void:
	target = player
	pass
	
func _process(delta: float) -> void:
	pass
