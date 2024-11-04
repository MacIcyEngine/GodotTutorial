extends Node2D

@onready var collectible_sprite: Sprite2D = %CollectibleSprite

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		EventHandler.emit_on_collected()
		queue_free()
