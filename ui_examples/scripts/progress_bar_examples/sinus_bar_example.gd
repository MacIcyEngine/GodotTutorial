extends ProgressBar

func _ready() -> void:
	min_value = -1.0
	max_value = 1.0

func _process(delta: float) -> void:
	var current_time: int = Time.get_ticks_msec()
	value = sin(current_time * 0.001)
