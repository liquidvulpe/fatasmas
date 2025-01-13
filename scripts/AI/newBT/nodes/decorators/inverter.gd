@icon("res://assets/icons/inverter.svg")
extends Decorator
class_name InverterDecorator

func _tick(actor, blackboard):
	for c in get_children():
		var response = c._tick(actor, blackboard)
		if(response == SUCCESS):
			return FAILURE
		if(response == FAILURE):
			return SUCCESS
		
		return RUNNING
