extends CharacterBody2D

var target
const SPEED = 0.75
var curr_area
var areas: Array
@onready var player = $'/root/'.find_child("fatasma", true, false)

var max_life = 10
var life = max_life
var atk_power = 10

func _on_area_2d_area_entered(area):
	if(area.is_in_group("area")):
		#areas.append(area)
		curr_area = area

func _process(delta):
	if(curr_area != null):
		if(curr_area.isActive):
			target = player
		else:
			target = null
	if(life <= 0):
		queue_free()

func _physics_process(delta):
	if(curr_area != null and target != null and $Timer.is_stopped()):
		position += sign(target.position - position)*SPEED
		move_and_slide()

func take_dmg(atk_power):
	if(life>0):
		life -= atk_power
		$Timer.start()

func _on_area_2d_body_entered(body):
	if(body.is_in_group("player")):
		body.take_dmg(atk_power)
