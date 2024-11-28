extends Task
class_name Inverter

var task: Task

static func create(task: Task) -> Inverter:
	var instance: Inverter = Inverter.new()
	instance.task = task
	return instance

func _execute(npc) -> TASK_STATUS:
	var STATUS: TASK_STATUS  = task._execute(npc)
	
	match STATUS:
		TASK_STATUS.SUCCESS:
			return TASK_STATUS.FAILURE
		TASK_STATUS.FAILURE:
			return TASK_STATUS.SUCCESS
	
	return TASK_STATUS.RUNNING
