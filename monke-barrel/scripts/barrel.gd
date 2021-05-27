extends KinematicBody2D

#Se carga la escena de monke
var monke_scene = preload("res://monke.tscn")
#Se obtiene el nodo de position
onready var monke_spawn: Position2D = get_node("Position2D")

var _vel: = 0.0 #velocidad de rotacion
var _rotacion #rotacion en grados del barril
var shooting = false #Bool que sirve para saber si se ha disparado
var gravity: = 10.0 #gravedad
var speed: = 200.0 #velocidad inicial
var direction: = Vector2() #dirección del disparo

#Se activan las fisicas y los inputs
func _ready() -> void:
	set_physics_process(true)
	set_process_input(true)

#Input del disparo
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shooting = true
	elif event.is_action_released("shoot"):
		shooting = false

func _process(delta: float) -> void:
	if shooting:
		fire_once() #funcion que se encarga del disparo
	_vel = 5.0
	rotate(_vel * delta) #hace rotar el barril
	_rotacion = fmod(rotation_degrees, 360) #recibe valores de rotacion, no son los del barril
	movimiento(_rotacion) #funcion que calcula la trayectoria del Donkey Kong

#Funcion encargada de que el Donkey Kong salga disparado
func shoot() -> void:
	var monke = monke_scene.instance() #Se pone en una variable las instancias del Donkey Kong
	monke.set_global_position(monke_spawn.get_global_position()) #Obtiene su posición global
	monke.shoot(direction, gravity) #Envia valores a una funcion de la escena Monke
	get_parent().add_child(monke) #Hace aparecer al Donkey Kong

#funcion que se encarga del disparo
func fire_once() -> void:
	shoot()
	shooting = false

#funcion que calcula la trayectoria del Donkey Kong
func movimiento(grados) -> void:
	direction.x = cos(grados) * speed
	direction.y += sin(grados) * speed

