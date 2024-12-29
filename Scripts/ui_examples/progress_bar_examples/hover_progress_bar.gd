extends ProgressBar

var is_hovered: bool = false

func _enter_tree() -> void:
	mouse_entered.connect(toggle_hovered)
	mouse_exited.connect(toggle_hovered)

func _exit_tree() -> void:
	mouse_entered.disconnect(toggle_hovered)
	mouse_exited.disconnect(toggle_hovered)

func _process(delta: float) -> void:
	if is_hovered:
		value += delta
	else:
		value -= delta

func toggle_hovered() -> void:
	is_hovered = !is_hovered
