extends Node2D

var banana_count: = 18

func _on_banana_banana_colected() -> void:
	banana_count -= 1
	print(banana_count)
	if banana_count == 0:
		get_tree().change_scene("res://WIIN.tscn")
