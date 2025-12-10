extends Node

var music_player : AudioStreamPlayer
var sfx_player := AudioStreamPlayer.new()

func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	add_child(sfx_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_sfx(stream_path):
	var s = load(stream_path)
	sfx_player.stream = s
	sfx_player.play()
