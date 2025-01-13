extends ActionLeaf

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	var player = actor.player
	var atk_power: int = actor.atk_power
	player.take_dmg(atk_power)
	return SUCCESS
