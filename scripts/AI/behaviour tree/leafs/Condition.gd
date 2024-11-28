extends Task
class_name Condition

var fn: Callable

static func create(fn: Callable) -> Condition:
	var instance: Condition = Condition.new()
	instance.fn = fn
	return instance

func _execute(npc) -> TASK_STATUS:
	return TASK_STATUS.SUCCESS if fn.call(npc) else TASK_STATUS.FAILURE
