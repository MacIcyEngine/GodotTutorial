extends Control

const WIDTH: int = 1280
const HEIGHT: int = 720

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.WHITE)
	get_tree().root.size.x = HEIGHT
	get_tree().root.size.y = WIDTH

	get_tree().root.position = Vector2(0.5 * (2560 - HEIGHT), 0.5 * (1440 - WIDTH))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		switch_aspect_ratio()

func switch_aspect_ratio() -> void:
	if get_tree().root.size.x == WIDTH:
		get_tree().root.size.x = HEIGHT
		get_tree().root.size.y = WIDTH
		get_tree().root.position = Vector2(0.5 * (2560 - HEIGHT), 0.5 * (1440 - WIDTH))
	else:
		get_tree().root.size.x = WIDTH
		get_tree().root.size.y = HEIGHT
		get_tree().root.position = Vector2(0.5 * (2560 - WIDTH), 0.5 * (1440 - HEIGHT))
