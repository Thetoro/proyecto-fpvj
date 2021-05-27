extends Node2D

#Cundo el Donkey Kong colisiona con este Area2D la escena cambia a la escena 
#Game_Over
func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("monke"):
		get_tree().change_scene("res://Game_Over.tscn")
