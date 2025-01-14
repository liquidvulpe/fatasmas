extends ConditionLeaf

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	var is_attacked: bool = actor.is_attacked
	if(is_attacked):
		return SUCCESS
	return FAILURE
