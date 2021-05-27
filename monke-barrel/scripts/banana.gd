extends Area2D

onready var _animated_sprite: AnimatedSprite = get_node("AnimatedSprite")
signal banana_colected

func _ready() -> void:
	_animated_sprite.play("banana") #Corre la animación de la banana
	connect("body_entered", self, "_on_body_entered") #Conecta la banana con la funcion

#En esta funcion se realiza la desaparición del platano a la hora de que
#el Donkey Kong colisiona con ellas
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("monke"): 
		#Esta es una señal que se emite al recolectar los platanos
		#su funcion radica en saber cuantos de estos han sido recolectados
		emit_signal("banana_colected") 
		queue_free() #desaparece el nodo del platano
		get_node("CollisionShape2D").disabled = true #Desactiva las colisiones
