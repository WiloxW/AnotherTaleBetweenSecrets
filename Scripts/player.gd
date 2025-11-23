extends CharacterBody2D

#Creada variable de velocidad para el movimiento
const speed = 180

#funcion que procesa las fisicas y las refleja frame por frame
#en el juego
func _physics_process(delta):
	player_movement(delta)

#comprobar que si algunas de las 4 direcciones esta siendoo
#entonces se aplica un vector para trasladar al Player
func player_movement(delta):
	
	var input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	velocity = input.normalized() * speed

	move_and_slide()
