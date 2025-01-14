extends ConditionLeaf

func _tick(actor, blackboard):
	var curr_area = blackboard._get('curr_area')
	if(curr_area && curr_area.isActive):
		return SUCCESS
	return FAILURE
