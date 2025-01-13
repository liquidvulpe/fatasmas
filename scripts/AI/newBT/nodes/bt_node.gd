@icon("res://assets/icons/action.svg")
extends BehaviorTree
class_name BehaviorTreeNode

enum {SUCCESS, FAILURE, RUNNING}

func _tick(actor: CharacterBody2D, blackboard: Blackboard):
	pass
