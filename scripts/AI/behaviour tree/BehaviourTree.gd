extends Node
class_name BehaviourTree

var task: Task
var taskStatus: Task.TASK_STATUS
var action: Action
var condition: Condition
var sequence: Sequence
var selection: Selection
var parallel: Parallel
var inverter: Inverter
var repeat: Repeat
var repeatUntilSuceed: RepeatUntilSucced
