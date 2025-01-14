extends ActionLeaf

@export var SPEED: int = 50

func _tick(actor, blackboard):
	var mouse_position = get_viewport().get_mouse_position()
	print(blackboard._get('delta') * SPEED)
	actor.position += actor.position.direction_to(mouse_position) * SPEED * blackboard._get('delta')
	return SUCCESS
