extends Area2D



func _on_moneda_body_entered(body: PhysicsBody2D) -> void:
	get_node("CollisionShape2D").disabled = true
	queue_free();
