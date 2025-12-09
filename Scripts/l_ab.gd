extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
		get_tree().change_scene_to_file("res://Scenes/room_a.tscn")
	
