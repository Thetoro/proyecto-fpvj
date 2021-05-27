extends KinematicBody2D

#Velocidad inicial de movimiento horizontal provocado por los inputs de movimiento
var speed: = Vector2(100.0, 1.0)
var velocity: = Vector2.ZERO #Velocidad de movimiento horizontal
var _gravity: = 0.0 #variable que recibirá la gravedad
var _movement: = Vector2() #variable que recibirá la trayectoria del Donkey Kong

#Cuando el Donkey Kong toque el barril desaparecerá dando el efecto que 
#entró nuevamente al barril
func _on_body_entered(body: Node) -> void:
	if body.get_name() == "Barrel":
		queue_free()
	get_node("CollisionShape2D").disabled = true

#Funcion que recibe los datos dadon en la escena del barril
func shoot(direction, gravity) -> void:
	_gravity = gravity
	_movement = direction 
	set_physics_process(true) #Activa las fisicas

#Funcion que se encarga de calcular las fisicas
func _physics_process(delta: float) -> void:
	var dir = movimiento() #Calcula el movimiento horizontal provocado por los inputs de movimiento
	_movement.y += _gravity * delta #calcula el movimiento en y
	_movement.x = speed.x * dir.x #calcula el movimiento en x
	_movement = move_and_slide(_movement) #Hace que el Donkey Kong se mueva

#Calcula el movimiento horizontal provocado por los inputs de movimiento
func movimiento() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	1.0)
