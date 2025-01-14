extends ActionLeaf

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	var steering: Vector2 = Vector2.ZERO
	
	var vector_to_target: Vector2 = actor.player.position - actor.position
	if(vector_to_target.length() > actor.ARRIVAL_ZONE_RADIUS):
		return FAILURE
	
	steering += arrival_steering(vector_to_target, actor.ARRIVAL_ZONE_RADIUS, actor.MAX_SPEED, actor.velocity)
	
	actor.set_enemy_velocity(steering)
	
	return SUCCESS

func arrival_steering(vector_to_target: Vector2, arrival_zone_radius: float, max_speed: int, velocity: Vector2) -> Vector2:
	var speed: float = (vector_to_target.length()/arrival_zone_radius) * max_speed
	var desired_velocity: Vector2 = vector_to_target.normalized() * speed
	
	return desired_velocity - velocity
