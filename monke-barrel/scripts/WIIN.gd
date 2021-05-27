extends Control

#Si precionas el botón te envia al menú inicial
func _on_TextureButton_pressed() -> void:
	get_tree().change_scene("res://Menu inicial.tscn")
