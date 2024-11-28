extends Node
class_name Task

enum TASK_STATUS{
	RUNNING,
	SUCCESS,
	FAILURE
}

func _execute(npc) -> TASK_STATUS:
	return TASK_STATUS.FAILURE
