extends Button

func _enter_tree() -> void:
	pressed.connect(change_to_menu_scene)

func _exit_tree() -> void:
	pressed.disconnect(change_to_menu_scene)

func change_to_menu_scene() -> void:
	get_tree().change_scene_to_file("res://Scenes/ui_examples/example_menu.tscn")
