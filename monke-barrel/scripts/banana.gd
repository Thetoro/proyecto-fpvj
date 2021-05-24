extends Area2D

onready var _animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

func _ready() -> void:
	_animated_sprite.play("banana")

func _on_body_entered(body: Node) -> void:
	queue_free()
