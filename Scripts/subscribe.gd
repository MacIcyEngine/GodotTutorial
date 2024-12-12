extends Control

@onready var subscribe: Button = %Subscribe
@onready var unsubscribe: Button = %Unsubscribe

func _on_subscribe_pressed() -> void:
	subscribe.visible = false
	unsubscribe.visible = true

func _on_unsubscribe_pressed() -> void:
	subscribe.visible = true
	unsubscribe.visible = false
