extends AudioStreamPlayer

#Audio de la escena Game_Over
func _ready() -> void:
	#Variable que contiene el archivo de audio
	var audio: AudioStreamOGGVorbis = preload("res://Sound/Lost Life.ogg")
	self.set_stream(audio) #Se aplica el audio
	self.set_volume_db(3.0) #Volumnes del audio
	self.play() #Con esto se escucha la musica
