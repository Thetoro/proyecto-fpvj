extends KinematicBody2D

var speed: = Vector2(100.0, 1.0)
var velocity: = Vector2.ZERO
var _gravity: = 0.0
var _movement: = Vector2()


func _on_body_entered(body: Node) -> void:
	if body.get_name() == "Barrel":
		queue_free()
	get_node("CollisionShape2D").disabled = true

func shoot(direction, gravity) -> void:
	_gravity = gravity
	_movement = direction 
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	var dir = movimiento()
	_movement.y += _gravity * delta
	_movement.x = speed.x * dir.x
	if dir.y == -1.0:
		_movement.y = speed.y * dir.y
	_movement = move_and_slide(_movement)
#	velocity = calculate_move_velocity(velocity, dir, speed)
#	velocity = move_and_slide(velocity)


func movimiento() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	1.0)

#func calculate_move_velocity(
#		linear_velocity: Vector2, 
#		direction: Vector2, 
#		speed: Vector2
#	) -> Vector2:
#	var out: = linear_velocity
#	out.x += speed.x * direction.x
#	out.y += 0.0
#	return out
