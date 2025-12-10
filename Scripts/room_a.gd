extends Node2D

@onready var TransactionAnimation = $TransactionAnimation/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TransactionAnimation.play("fade_out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_backlab_a_body_entered(body: Node2D) -> void:
	if body is Player:
		TransactionAnimation.play("fade_in")
		await get_tree().create_timer(0.3).timeout
		MusicManager.play_sfx("res://Assets/Sounds/opening-door-411632.mp3")
		global.spawn_id = "SpawnRoomA"
		get_tree().change_scene_to_file("res://Scenes/l_ab.tscn")
		

func _on_backlab_b_body_entered(body: Node2D) -> void:
	if body is Player:
		TransactionAnimation.play("fade_in")
		await get_tree().create_timer(0.3).timeout
		MusicManager.play_sfx("res://Assets/Sounds/opening-door-411632.mp3")
		global.spawn_id = "SpawnRoomB"
		get_tree().change_scene_to_file("res://Scenes/l_ab.tscn")


func _on_backlab_c_body_entered(body: Node2D) -> void:
	if body is Player:
		TransactionAnimation.play("fade_in")
		await get_tree().create_timer(0.3).timeout
		MusicManager.play_sfx("res://Assets/Sounds/opening-door-411632.mp3")
		global.spawn_id = "SpawnRoomC"
		get_tree().change_scene_to_file("res://Scenes/l_ab.tscn")
