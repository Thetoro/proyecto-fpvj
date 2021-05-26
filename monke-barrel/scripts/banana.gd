extends Area2D

onready var _animated_sprite: AnimatedSprite = get_node("AnimatedSprite")
signal banana_colected

func _ready() -> void:
	_animated_sprite.play("banana")
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("monke"):
		emit_signal("banana_colected")
		queue_free()
		get_node("CollisionShape2D").disabled = true
