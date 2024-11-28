extends Task
class_name Parallel

var taskList: Array[Task]
var numToSuceed: int
var numToFail: int

static func create(taskList: Array[Task], numToSuceed: int, numToFail: int) -> Parallel:
	var instance: Parallel = Parallel.new()
	instance.taskList = taskList
	instance.numToSuceed = numToSuceed
	instance.numToFail = numToFail
	return instance

func _execute(gameObject) -> TASK_STATUS:
	var countSucess: int = 0
	var countFailure: int = 0
	for task: Task in taskList:
		var STATUS: TASK_STATUS = task._execute(gameObject)
		match STATUS:
			TASK_STATUS.SUCCESS:
				countSucess += 1
			TASK_STATUS.FAILURE:
				countFailure += 1
	
	var result: TASK_STATUS
	
	if(countSucess >= numToSuceed):
		result = TASK_STATUS.SUCCESS
	elif(countFailure >= numToFail):
		result = TASK_STATUS.FAILURE
	else:
		result = TASK_STATUS.RUNNING
	
	return result
