extends Control
class_name MorteMenu

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level/main.tscn")
