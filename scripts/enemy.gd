extends CharacterBody2D

var target
const SPEED = 0.75
var curr_area

func _on_area_2d_area_entered(area):
	if(area.is_in_group("area")):
		curr_area = area

func _process(delta):
	target = curr_area.player

func _physics_process(delta):
	if(curr_area != null and target != null):
		position += sign(target.position - position)*SPEED
		move_and_slide()
