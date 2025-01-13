@icon("res://assets/icons/sequencer.svg")
extends Composite
class_name SequenceComposite

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	for c in get_children():
		var response = c._tick(actor, blackboard)
		
		if(response != SUCCESS):
			return response
	return SUCCESS
