extends Task
class_name RepeatUntilSucced

var task: Task

static func create(task: Task) -> RepeatUntilSucced:
	var instance: RepeatUntilSucced = RepeatUntilSucced.new()
	instance.task = task
	return instance

func _execute(npc) -> TASK_STATUS:
	var STATUS: TASK_STATUS = task._execute(npc)
	if(STATUS == TASK_STATUS.SUCCESS):
		return TASK_STATUS.SUCCESS
	
	return TASK_STATUS.RUNNING
