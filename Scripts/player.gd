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
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		velocity.x = 0
	else:
		velocity.x = 0
		velocity.y = 0

	move_and_slide()
