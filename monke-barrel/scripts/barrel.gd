extends Rotate

func _ready() -> void:
	set_physics_process(true)

func _process(delta: float) -> void:
	_vel = 5.0
	rotate(_vel * delta)
