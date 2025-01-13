@icon("res://assets/icons/limiter.svg")
extends Decorator
class_name LimiterDecorator

@onready var cache_key = 'limiter_%s' % get_instance_id()
@export var max_count: float = 0

func _tick(actor, blackboard):
	var current_count = blackboard.get(cache_key)
	
	if(current_count == null):
		current_count = 0
		
	if(current_count <= max_count):
		blackboard.set(cache_key, current_count + 1)
		return get_child(0)._tick(actor, blackboard)
	else:
		return FAILED
