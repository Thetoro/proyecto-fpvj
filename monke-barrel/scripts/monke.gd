extends Rotate

var speed: = Vector2(25.2, 25.0)
var velocity: = Vector2.ZERO
var gravity: = 9.8

func _ready() -> void: 
	if Input.is_action_pressed("shoot"):
		set_physics_process(true)

func _physics_process(delta: float) -> void:
	var rot = fmod(rotation_degrees, 360)
	var dir = movimiento(rot)
	velocity = calculate_move_velocity(velocity, dir, speed)
	velocity = move_and_slide(velocity)

func movimiento(barril: float) -> Vector2:
	return Vector2(cos(barril), sin(barril))

func calculate_move_velocity(
		linear_velocity: Vector2, 
		direction: Vector2, 
		speed: Vector2
	) -> Vector2:
	var out: = linear_velocity
	out.x += speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time() + speed.y * direction.y
	return out
