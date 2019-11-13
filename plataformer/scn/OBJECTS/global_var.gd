extends Node
var monedas = 0
var vidas = 3
func _process(delta: float) -> void:
	if global_var.vidas == 0:
		get_tree().quit()
