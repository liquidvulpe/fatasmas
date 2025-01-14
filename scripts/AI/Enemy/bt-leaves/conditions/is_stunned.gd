extends ConditionLeaf

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	var is_stunned: bool = actor.is_stunned
	if(is_stunned):
		return SUCCESS
	return FAILURE
