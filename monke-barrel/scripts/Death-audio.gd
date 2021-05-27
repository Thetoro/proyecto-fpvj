extends AudioStreamPlayer

#Audio de la escena Game_Over
func _ready() -> void:
	var audio: AudioStreamOGGVorbis = preload("res://Sound/Lost Life.ogg")
	self.set_stream(audio)
	self.set_volume_db(3.0)
	self.play()
