extends Control

@onready var count_label: Label = %CountLabel

var collectible_count: int = 0

func _enter_tree() -> void:
	EventHandler.on_collected.connect(increase_collectible_count)

func _exit_tree() -> void:
	EventHandler.on_collected.disconnect(increase_collectible_count)

func increase_collectible_count() -> void:
	collectible_count += 1
	count_label.text = str(collectible_count)
