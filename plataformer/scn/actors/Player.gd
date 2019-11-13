extends Actor

export var  stomp_impulse: = 1000.0

func _on_enemydetector_area_entered(area: Area2D) -> void:
		velocity = calculate_stomp_velocity(velocity, stomp_impulse)

func _on_enemydetector_body_entered(body: PhysicsBody2D) -> void: 
	global_var.vidas = global_var.vidas - 1
	get_tree().get_nodes_in_group("level")[0].res()
	
func _physics_process(delta: float) -> void:
	var is_jump_high: = Input.is_action_just_released("ui_up") and velocity.y < 0.0
	var direction: = get_direction()
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_high)
	velocity = move_and_slide(velocity,Vector2.UP)
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		-1.0 if Input.is_action_just_pressed("ui_up") and is_on_floor() else 0.0
		)
		
func calculate_move_velocity(
lineal_velocity : Vector2,
direction : Vector2,
speed : Vector2,
is_jump_high: bool
) -> Vector2:
	var new_velocity = lineal_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
	 	new_velocity.y = speed.y * direction.y
	if is_jump_high:
		new_velocity.y = 0.0
	return new_velocity

func calculate_stomp_velocity(lineal_velocity: Vector2, impulse: float) -> Vector2:
	var new_velocity: = lineal_velocity
	new_velocity.y = -impulse
	return new_velocity
	



