extends CharacterBody2D

var target
const SPEED = 0.75
var curr_area
var areas: Array
@onready var player = $'/root/'.find_child("fatasma", true, false)

var max_life = 30
var life = max_life
var atk_power = 10

enum State {
	IDLE,
	PURSUING,
	STUNNED
}

var state = State.IDLE

func _on_area_2d_area_entered(area):
	if(area.is_in_group("area")):
		#areas.append(area)
		curr_area = area

func handle_arrive():
	if state == State.STUNNED or state == State.IDLE:
		target = null
	elif state == State.PURSUING:
		target = player


func _process(delta):
	if(curr_area != null and $Timer.is_stopped()):
		if(curr_area.isActive):
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
		body.take_dmg(atk_power)
