extends Control



func _on_JUGAR_pressed() -> void:
	$VBoxContainer/JUGAR.get_tree().change_scene("res://world.tscn")



func _on_SALIR_pressed() -> void:
	get_tree().quit()
