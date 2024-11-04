extends ProgressBar

@export var start_hp: int = 10
@export var invulnerable_duration: float = 1.0
@export var full_hp_color: Color
@export var empty_hp_color: Color

var stylebox: StyleBoxFlat
var invulnerable_timer: float = 0

func _init() -> void:
	stylebox = get_theme_stylebox("fill").duplicate() ## Default stylebox type is StyleBoxFlat
	add_theme_stylebox_override("fill", stylebox)

func _enter_tree() -> void:
	EventHandler.on_player_take_damage.connect(take_damage)

func _exit_tree() -> void:
	EventHandler.on_player_take_damage.disconnect(take_damage)

func _ready() -> void:
	max_value = start_hp
	value = start_hp
	update_hp_bar()

func _process(delta: float) -> void:
	if invulnerable_timer > 0:
		invulnerable_timer -= delta

func take_damage(damage: int) -> void:
	if invulnerable_timer <= 0:
		value -= damage
		update_hp_bar()

		invulnerable_timer = invulnerable_duration

		if value <= 0:
			EventHandler.emit_on_player_death()

func update_hp_bar() -> void:
	if value:
		stylebox.bg_color = lerp(empty_hp_color, full_hp_color, value / max_value)
