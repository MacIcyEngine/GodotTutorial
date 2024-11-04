extends Control

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		toggle()

func toggle() -> void:
	visible = !visible
	if visible:
		Engine.time_scale = 0.0
	else:
		Engine.time_scale = 1.0

func _on_resume_button_pressed() -> void:
	toggle()
