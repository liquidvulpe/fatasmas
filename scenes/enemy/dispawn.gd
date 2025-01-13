extends ActionLeaf

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	actor.queue_free()
	
	print_debug("ouchie")
	return SUCCESS
