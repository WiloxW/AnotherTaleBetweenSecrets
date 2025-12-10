extends Node2D

@onready var TransactionAnimation = $TransactionAnimation/AnimationPlayer
@onready var TextBox = $TextBox
var door_sound : AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	TextBox.show_text([
	"Esta es la primera línea.",
	"Y esta es la segunda.",
	"¡Funcionó como un RPG clásico!"
] as Array[String])
	TransactionAnimation.play("fade_out")
	door_sound = $Dooropen
	if not MusicManager.music_player.playing:
		MusicManager.music_player.stream = load("res://Assets/Music/horror-background-atmosphere-011-240870.mp3")
		MusicManager.music_player.stream.set_loop(true)
		MusicManager.music_player.play()
	if global.spawn_id != "":
		var spawn = get_node_or_null(global.spawn_id)
		if spawn:
			var player = get_node("Player")
			player.position = spawn.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_trans_point_room_a_body_entered(body) -> void:
	if body is Player:
		TransactionAnimation.play("fade_in")
		await get_tree().create_timer(0.3).timeout
		MusicManager.play_sfx("res://Assets/Sounds/opening-door-411632.mp3")
		get_tree().change_scene_to_file("res://Scenes/room_a.tscn")
	


func _on_trans_point_room_b_body_entered(body: Node2D) -> void:
	if body is Player:
		TransactionAnimation.play("fade_in")
		await get_tree().create_timer(0.3).timeout
		MusicManager.play_sfx("res://Assets/Sounds/opening-door-411632.mp3")
		get_tree().change_scene_to_file("res://Scenes/room_b.tscn")
		

func _on_trans_point_room_c_body_entered(body: Node2D) -> void:
	if body is Player:
		TransactionAnimation.play("fade_in")
		await get_tree().create_timer(0.3).timeout
		MusicManager.play_sfx("res://Assets/Sounds/opening-door-411632.mp3")
		get_tree().change_scene_to_file("res://Scenes/room_c.tscn")
