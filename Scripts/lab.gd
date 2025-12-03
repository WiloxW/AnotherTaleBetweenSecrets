extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_trans_point_room_a_body_entered(body) -> void:
	if body is Player:
		get_tree().change_scene_to_file("res://Scenes/room_a.tscn")


func _on_trans_point_room_a_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		global.transition_scene = false
		
func change_scene():
	if global.transition_scene == true:
		if global.current_scene == "lab":
			get_tree().change_scene_to_file("res://Scenes/room_a.tscn")
			global.finish_changescenes()		
