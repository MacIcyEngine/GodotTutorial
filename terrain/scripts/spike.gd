extends Node2D

@export var spike_damage: int = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		EventHandler.on_player_take_damage.emit(spike_damage)
