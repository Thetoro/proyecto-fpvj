extends Rotate

var speed: = Vector2(400.0, 200.0)
var velocity: = Vector2.ZERO
var gravity: = 9.8

func _ready() -> void:
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	var dir = movimiento()
	velocity = calculate_move_velocity(velocity, dir, speed)
	velocity = move_and_slide(velocity)

func movimiento() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))

func calculate_move_velocity(
		linear_velocity: Vector2, 
		direction: Vector2, 
		speed: Vector2
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	return out
