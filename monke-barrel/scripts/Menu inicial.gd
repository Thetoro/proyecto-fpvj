extends Control

#Al momento de precionar este botón te llevará al juego
func _on_JUGAR_pressed() -> void:
	$VBoxContainer/JUGAR.get_tree().change_scene("res://world.tscn")

#Al momento de precionar este botón cerrará el juego
func _on_SALIR_pressed() -> void:
	get_tree().quit()
