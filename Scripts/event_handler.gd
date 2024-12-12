extends Node

#region UI
signal on_collected()
func emit_on_collected() -> void:
	on_collected.emit()
#endregion

#region Player
signal on_player_take_damage(damage: int)
func emit_on_player_take_damage(damage: int):
	on_player_take_damage.emit(damage)
#endregion
