extends Task
class_name Action

var fn: Callable

# Constructor
static func create(fn: Callable) -> Action:
	var instance: Action = Action.new()
	instance.fn = fn
	return instance

func _execute(npc) -> TASK_STATUS:
	return fn.call(npc)
