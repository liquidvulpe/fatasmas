@icon("res://assets/icons/fail.svg")
extends Decorator
class_name AlwaysFailDecorator

func _tick(actor, blackboard):
	for c in get_children():
		var response = c._tick(actor, blackboard)
		if(response == RUNNING):
			return RUNNING
		return FAILURE
