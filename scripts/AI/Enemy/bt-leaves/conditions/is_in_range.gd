extends ConditionLeaf

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	var can_attack: bool = actor.can_attack
	if(can_attack):
		return SUCCESS
	return FAILURE
