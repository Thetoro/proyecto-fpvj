extends KinematicBody2D

var monke_scene = preload("res://monke.tscn")
onready var monke_spawn: Position2D = get_node("Position2D")
#onready var barril_rotation: Sprite = get_node("barrel")

var _vel: = 0.0
var _rotacion
var shooting = false
#Variables temporales
var gravity: = 10.0
var speed: = 200.0
#var grados: = set_global_rotation(barril_rotation.get_global_rotation())
var direction: = Vector2()
var monke_count: = 0

func _ready() -> void:
	set_physics_process(true)
	set_process_input(true)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shooting = true
	elif event.is_action_released("shoot"):
		shooting = false

func _process(delta: float) -> void:
	if shooting:
		fire_once()
	_vel = 5.0
	rotate(_vel * delta)
	_rotacion = fmod(rotation_degrees, 360)
	movimiento(_rotacion)

func shoot() -> void:
	var monke = monke_scene.instance()
	monke.set_global_position(monke_spawn.get_global_position())
	monke.shoot(direction, gravity)
	get_parent().add_child(monke)

func fire_once() -> void:
	shoot()
	shooting = false

func movimiento(grados) -> void:
	direction.x = cos(grados) * speed
	direction.y += sin(grados) * speed

