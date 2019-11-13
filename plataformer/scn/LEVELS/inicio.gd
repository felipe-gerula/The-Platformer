extends Node2D
export (PackedScene) var scn_game
var x 
func _ready() -> void:
	global_var.vidas = 3


func _on_pausaboton_pressed() -> void:
	get_node("tema").stop()
	x = get_node("tema").get_playback_position()

 
func _on_returnboton_pressed() -> void:
	if(!get_node("tema").is_playing()):
		get_node("tema").play(x)



func _on_inicioboton_pressed() -> void:
	get_tree().change_scene_to(scn_game)





func _on_cierreboton_pressed() -> void:
	get_tree().quit()
