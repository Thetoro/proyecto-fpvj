extends Sprite

#Hace rotar el sprite del Donkey Kong
func _process(delta: float) -> void:
	rotate(10.0 * delta)
