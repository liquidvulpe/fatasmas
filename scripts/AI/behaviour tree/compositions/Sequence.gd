extends Task
class_name Sequence

var taskList: Array[Task]

static func create(taskList: Array[Task]) -> Sequence:
	var instance: Sequence = Sequence.new()
	instance.taskList = taskList
	return instance

func _execute(gameObject) -> TASK_STATUS:
	for task: Task in taskList:
		var STATUS: TASK_STATUS = task._execute(gameObject)
		if (STATUS != TASK_STATUS.SUCCESS):
			return STATUS
	
	return TASK_STATUS.SUCCESS
