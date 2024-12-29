extends Control

@onready var toggle_me_text: Label = %ToggleMeText

func _on_toggle_me_toggled(toggled_on: bool) -> void:
	toggle_me_text.text = str("Toggle: ", toggled_on)
