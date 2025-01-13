@icon("res://assets/icons/category_composite.svg")
extends BehaviorTreeNode
class_name Composite

func _ready() -> void:
	if(get_child_count() < 1):
		print("BehaviorTree Error: Composite %s should have at least one child" % self.name)
