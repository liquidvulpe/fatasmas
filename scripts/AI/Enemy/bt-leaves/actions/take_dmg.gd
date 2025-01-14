extends ActionLeaf

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	var player = actor.player
	var timer = actor.timer

	actor.life -= player.atk_power
	actor.is_stunned = true
	timer.start()
	actor.is_attacked = false
	
	print_debug("ouch")
	return SUCCESS
