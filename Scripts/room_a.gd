extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_backlab_a_body_entered(body: Node2D) -> void:
	if body is Player:
		global.spawn_id = "SpawnRoomA"
		get_tree().change_scene_to_file("res://Scenes/l_ab.tscn")
		

func _on_backlab_b_body_entered(body: Node2D) -> void:
	if body is Player:
		global.spawn_id = "SpawnRoomB"
		get_tree().change_scene_to_file("res://Scenes/l_ab.tscn")


func _on_backlab_c_body_entered(body: Node2D) -> void:
	if body is Player:
		global.spawn_id = "SpawnRoomC"
		get_tree().change_scene_to_file("res://Scenes/l_ab.tscn")
