extends HBoxContainer

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
