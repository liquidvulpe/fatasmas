extends CharacterBody2D

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

enum State {
	IDLE,
	PURSUING,
	STUNNED,
	ATTACKING,
}

var state = State.IDLE

func _on_area_2d_area_entered(area):
	if(area.is_in_group("area")):
		if(curr_area == null):
			curr_area = area
		else:
			new_area = area

func handle_arrive():
	if state == State.STUNNED or state == State.IDLE:
		target = null
	elif state == State.PURSUING:
		target = player


func _process(delta):
	
	if(curr_area != null and $Timer.is_stopped() && player != null):
		#print(state)
		if(state == State.PURSUING && attack_cooldown.is_stopped()):
			#print("A1")
			if(can_attack):
				state = State.ATTACKING
		
		if(state == State.ATTACKING):
			player.take_dmg(atk_power)
			attack_cooldown.start()
			state = State.IDLE
		elif(curr_area.isActive):
			state = State.PURSUING
			handle_arrive()
		else:
			state = State.IDLE
			handle_arrive()
	if(life <= 0):
		queue_free()

func _physics_process(delta):
	if(state == State.PURSUING):
		position += sign(target.position - position)*SPEED
		move_and_slide()

func take_dmg(atk_power):
	if(life>0):
		life -= atk_power
		state = State.STUNNED
		handle_arrive()
		$Timer.start()

func _on_area_2d_body_entered(body):
	if(body.is_in_group("player")):
		can_attack = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.is_in_group("player")):
		can_attack = false

func _on_area_2d_area_exited(area: Area2D) -> void:
	if(area.is_in_group("area") && area == curr_area):
		curr_area = new_area
