extends "res://scn/actors/actor.gd"

func _ready() -> void:
	set_physics_process(false)
	velocity.x = -speed.x
func _on_stomp_body_entered(body: PhysicsBody2D) -> void:
	if(body!=null):
		if (body.global_position.y > 
		get_node("stomp").global_position.y):
			return
	get_node("CollisionShape2D").disabled = true
	queue_free()

func _physics_process(delta: float) -> void:
	velocity.y = gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, Vector2.UP).y