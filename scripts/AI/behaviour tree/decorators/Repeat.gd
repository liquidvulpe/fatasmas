extends Task
class_name Repeat

var task: Task

static func create(task: Task) -> Repeat:
	var instance: Repeat = Repeat.new()
	instance.task = task
	return instance

func _execute(npc) -> TASK_STATUS:
	task._execute(npc)
	
	return TASK_STATUS.RUNNING
