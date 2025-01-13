@icon("res://assets/icons/selector.svg")
extends Composite
class_name SelectorComposite

func _tick(actor, blackboard):
	for c in get_children():
		var response = c._tick(actor, blackboard)
		
		if(response != FAILURE):
			return response
	return FAILURE
