extends ActionLeaf

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	var steering: Vector2 = Vector2.ZERO
	
	var vector_to_target: Vector2 = actor.target.position - actor.position
	if(vector_to_target.length() > actor.ARRIVAL_ZONE_RADIUS):
		steering += seek_steering(vector_to_target, actor.MAX_SPEED, actor.velocity)
	else:
		return SUCCESS
	
	actor.set_enemy_velocity(steering)

	
	return FAILURE

func seek_steering(vector_to_target: Vector2, max_speed: int, velocity: Vector2) -> Vector2:
	var desired_velocity: Vector2 = vector_to_target.normalized() * max_speed
	
	return desired_velocity - velocity
