extends Control

#Cuando presiones el botón te llevara al menú inicial
func _on_TextureButton_pressed() -> void:
	get_tree().change_scene("res://Menu inicial.tscn")
