@icon("res://assets/icons/action.svg")
extends BehaviorTreeNode
class_name Leaf

func _ready() -> void:
	if(get_child_count() != 0):
		print("BehaviorTree Error: Leaf %s should not have children" % self.name)

# DO NOT CHANGE THIS SCRIPT. GO TO INSPECTOR SCRIPT -> EXTEND SCRIPT
