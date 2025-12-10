extends Node
 
var current_scene = "lab" #LabCenter, room_a, roomB, roomC
var transition_scene = false
var spawn_id := ""
var can_move := true
var dialog_shown := {} 
var collected_items = {}
var inventory: Array = []

var spawn_point_name := ""

var player_enterA_posx = 0
var player_enterA_posy = 0
var player_start_posx = 0
var player_start_posy = 0

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "lab":
			current_scene = "room_a"
		else:
			current_scene = "lab"
			
