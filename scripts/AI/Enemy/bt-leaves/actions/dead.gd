extends ConditionLeaf

func _tick(actor, blackboard):
	var life: int = actor.life
	if(life <= 0):
		return SUCCESS
	return FAILURE
