extends Node2D

@export var spike_damage: int = 1

var player: PlayerController

func _process(delta: float) -> void:
	if player:
		EventHandler.emit_on_player_take_damage(spike_damage)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		player = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		player = null
