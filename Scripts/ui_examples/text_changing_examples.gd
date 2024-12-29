extends Node

@onready var label_example_1: Label = %LabelExample1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		label_example_1.text = "Some different text"
