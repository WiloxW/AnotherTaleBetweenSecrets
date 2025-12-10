extends CanvasLayer

@export var text_speed := 0.03  # velocidad del tipeo

var texts : Array[String] = []
var current_index := 0
var is_writing := false

func _ready() -> void:
	visible = false

func show_text(text_array: Array) -> void:
	global.can_move = false
	texts = text_array
	current_index = 0
	visible = true
	_write_text()

func _write_text():
	is_writing = true
	$Panel/Label.text = ""
	var full_text = texts[current_index]
	
	for c in full_text:
		if not is_writing:
			break
		$Panel/Label.text += c
		await get_tree().create_timer(text_speed).timeout
		
	is_writing = false
	$Panel/Label.text = full_text

func _process(_delta):
	if not visible: 
		return
	if Input.is_action_just_pressed("ui_accept"):
		if is_writing:
			# Terminar de escribir instantáneamente
			is_writing = false
			return
		current_index += 1
		if current_index < texts.size():
			_write_text()	
		else:
			visible = false  # cerrar textbox
			global.can_move = true
