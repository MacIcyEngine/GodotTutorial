extends Node

@onready var label_example_1: Label = %LabelExample1
@onready var label_example_2: Label = %LabelExample2

var counter: int = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		label_example_1.text = "Some different text"
		counter += 1
		label_example_2.text = str(counter)
