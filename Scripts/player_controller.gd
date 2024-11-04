class_name PlayerController

extends CharacterBody2D

@export var walk_speed = 150.0
@export var run_speed = 250.0
@export_range(0, 1) var acceleration = 0.1
@export_range(0, 1) var deceleration = 0.1

@export var jump_force = -400.0
@export_range(0, 1) var decelerate_on_jump_release = 0.5

@export var dash_speed = 1000.0
@export var dash_max_distance = 300.0
@export var dash_curve: Curve
@export var dash_cooldown = 1.0
@export var ui_dash_cooldown: UIAbilityCooldown

@export var animated_sprite : AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_dashing = false
var dash_start_position = 0
var dash_direction = 0

func _physics_process(delta):
	if !delta:
		return

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	var speed
	if Input.is_action_pressed("run"):
		speed = run_speed
	else:
		speed = walk_speed

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, speed * acceleration)
		animated_sprite.flip_h = direction == -1
		if is_on_floor():
			if Input.is_action_pressed("run"):
				animated_sprite.play("RunSword")
			else:
				animated_sprite.play("WalkSword")
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * deceleration)
		if is_on_floor():
			animated_sprite.play("IdleSword")

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_wall()):
		velocity.y = jump_force
		animated_sprite.play("Jump")

	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release

	# Dash activation
	if Input.is_action_just_pressed("dash") and direction and not is_dashing and not ui_dash_cooldown.is_on_cooldown():
		is_dashing = true
		dash_start_position = position.x
		dash_direction = direction
		ui_dash_cooldown.set_cooldown(dash_cooldown)

	# Performs actual dash
	if is_dashing:
		var current_distance = abs(position.x - dash_start_position)
		if current_distance >= dash_max_distance or is_on_wall():
			is_dashing = false
		else:
			velocity.x = dash_direction * dash_speed * dash_curve.sample(current_distance / dash_max_distance)
			velocity.y = 0

	move_and_slide()
