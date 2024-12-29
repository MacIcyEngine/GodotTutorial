extends Node

@onready var label_example_1: Label = %LabelExample1
@onready var label_example_2_x: Label = %LabelExample2_x
@onready var label_example_2_y: Label = %LabelExample2_y
@onready var label_example_3: Label = %LabelExample3

var counter: int = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		label_example_1.text = "Some different text"
		counter += 1
		label_example_3.text = str(counter)

	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	label_example_2_x.position.x = mouse_pos.x
	label_example_2_y.position.y = mouse_pos.y
	label_example_2_x.text = str("Mouse x: ", mouse_pos.x)
	label_example_2_y.text = str("Mouse y: ", mouse_pos.y)
