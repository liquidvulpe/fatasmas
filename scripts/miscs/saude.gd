extends Node2D

var healing = 10

func _on_area_2d_body_entered(body):
	if(body.is_in_group("player")):
		body.heal(healing)
		queue_free()
