extends KinematicBody2D
class_name Rotate

var _vel: = 0.0
var _ace: = 0.0
var _rotacion

func _ready() -> void:
	set_physics_process(true)

func _process(delta: float) -> void:
	_vel = 5.0
	rotate(_vel * delta)
	_rotacion = fmod(rotation_degrees, 360)

