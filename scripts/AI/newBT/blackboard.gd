@icon("res://assets/icons/blackboard.svg")
extends RefCounted
class_name Blackboard

var blackboard: Dictionary = {}

func _set(key, value, blackboard_name: String = 'default'):
	if(!blackboard.has(blackboard_name)):
		blackboard[blackboard_name] = {}
	
	blackboard[blackboard_name][key] = value
	
func _get(key, default_value = null, blackboard_name = 'default'):
	if(has(key, blackboard_name)):
		return blackboard[blackboard_name].get(key, default_value)
	return default_value
	
func has(key, blackboard_name = 'default') -> bool:
	return blackboard.has(blackboard_name) && blackboard[blackboard_name].has(key) && blackboard[blackboard_name][key] != null

func erase(key, blackboard_name = 'default') -> void:
	if(blackboard.has(blackboard_name)):
		blackboard[blackboard_name][key] = null
