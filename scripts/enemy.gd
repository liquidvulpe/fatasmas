extends CharacterBody2D

var target
const SPEED = 0.5
var curr_area

var max_life = 100
var life = max_life
var atk_power = 10

func _on_area_2d_area_entered(area):
	if(area.is_in_group("area")):
		curr_area = area

func _process(delta):
	target = curr_area.player
	if(life <= 0):
		queue_free()

func _physics_process(delta):
	if(curr_area != null and target != null):
		position += sign(target.position - position)*SPEED
		move_and_slide()


func _on_area_2d_body_entered(body):
	if(body.is_in_group("player")):
		body.take_dmg(atk_power)
