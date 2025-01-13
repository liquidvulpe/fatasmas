@icon("res://assets/icons/succeed.svg")
extends Decorator
class_name AlwaysSucceedDecorator

func _tick(actor, blackboard):
	for c in get_children():
		var response = c._tick(actor, blackboard)
		if(response == RUNNING):
			return RUNNING
		return SUCCESS
