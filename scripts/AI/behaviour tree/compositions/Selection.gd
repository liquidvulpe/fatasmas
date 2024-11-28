extends Task
class_name Selection

var taskList: Array[Task]

static func create(taskList: Array[Task]) -> Selection:
	var instance: Selection = Selection.new()
	instance.taskList = taskList
	return instance

func _execute(gameObject) -> TASK_STATUS:
	for task: Task in taskList:
		var STATUS: TASK_STATUS = task._execute(gameObject)
		if (STATUS != TASK_STATUS.FAILURE):
			return STATUS
	
	return TASK_STATUS.FAILURE
