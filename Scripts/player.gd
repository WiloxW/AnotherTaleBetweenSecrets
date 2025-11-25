extends CharacterBody2D

#Creada variable de velocidad para el movimiento
const speed = 180

#funcion que procesa las fisicas y las refleja frame por frame
#en el juego
func _physics_process(_delta):
	player_movement()

#comprobar que si algunas de las 4 direcciones esta siendoo
#entonces se aplica un vector para trasladar al Player
func player_movement():
	
	var input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	velocity = input.normalized() * speed

	move_and_slide()
	
	clamp_player_to_screen()

func clamp_player_to_screen():
	var screen_size = get_viewport_rect().size
	var half_w = 0.0
	var half_h = 0.0
	
	var cs = $CollisionShape2D
	if cs and cs.shape:
		var shape = cs.shape
		half_w = shape.extents.x
		half_h = shape.extents.y
	
	position.x = clamp(position.x, half_w, screen_size.x - half_w)
	position.y = clamp(position.y, half_h, screen_size.y - half_h)
