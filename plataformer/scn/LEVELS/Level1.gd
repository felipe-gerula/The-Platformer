extends Node2D
export (PackedScene) var scn_game2
export (PackedScene) var jugador

func _ready() -> void:
	var NewPlayer = jugador.instance()
	add_child(NewPlayer)
	NewPlayer.global_position = get_node("spawn").global_position
	global_var.vidas = 3 
	
func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	get_tree().change_scene_to(scn_game2)

func res():
	get_tree().get_nodes_in_group("player")[0].queue_free()
	var NewPlayer = jugador.instance()
	add_child(NewPlayer)
	NewPlayer.global_position = get_node("spawn").global_position
	if global_var.vidas == 2:
		$vidas/vida.queue_free()
	elif global_var.vidas == 1:
		$vidas/vida2.queue_free()
	elif global_var.vidas == 0:
		$vidas/vida3.queue_free()
