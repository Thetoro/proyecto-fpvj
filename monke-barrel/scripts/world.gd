extends Node2D



func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("monke"):
		get_tree().change_scene("res://Game_Over.tscn")
