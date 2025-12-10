extends Node

var music_player : AudioStreamPlayer

func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
