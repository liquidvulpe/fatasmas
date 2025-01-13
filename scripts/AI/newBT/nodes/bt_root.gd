@icon("res://assets/icons/tree.svg")
extends BehaviorTree
class_name BehaviorTreeRoot

@export var enabled: bool = true

const Blackboard = preload("res://scripts/AI/newBT/blackboard.gd")
@onready var blackboard: Blackboard = Blackboard.new()

func _ready() -> void:
	if(get_child_count() != 1):
		print("Behavior Tree error: Root should have one child")
		disable()
		return

func _physics_process(delta: float) -> void:
	if(!enabled):
		return
	blackboard._set("delta", delta)
	var child: Composite = get_child(0)
	child._tick(get_parent(), blackboard)

func enable() -> void:
	enabled = true

func disable() -> void:
	enabled = false
