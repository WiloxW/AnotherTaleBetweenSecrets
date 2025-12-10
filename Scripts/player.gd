extends CharacterBody2D
class_name Player

#Creada variable de velocidad para el movimiento
@export var speed: float = 180.0
var last_dir := Vector2.DOWN
var footstep_sound : AudioStreamPlayer2D

func _ready():
	footstep_sound = $Footsteps

#funcion que procesa las fisicas y las refleja frame por frame
#en el juego
func _physics_process(_delta):
	player_movement()
	

#comprobar que si algunas de las 4 direcciones esta siendoo
#entonces se aplica un vector para trasladar al Player
func player_movement():
	if not global.can_move:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	var input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	velocity = input.normalized() * speed

	move_and_slide()
	clamp_player_to_screen()
	update_animation()

func clamp_player_to_screen():
	var screen_size = get_viewport_rect().size
	var half_w = 0.0
	var half_h = 0.0
	
	var cs = $BodyCollision
	if cs and cs.shape:
		var shape = cs.shape
		half_w = shape.extents.x
		half_h = shape.extents.y
	
	position.x = clamp(position.x, half_w, screen_size.x - half_w)
	position.y = clamp(position.y, half_h, screen_size.y - half_h)

func update_animation():
	var sprite = $Sprite
	
	if velocity.length() == 0:
		sprite.stop()
		
		if footstep_sound.playing:
			footstep_sound.stop()
	else:
		if not footstep_sound.playing:
			footstep_sound.play()
		if abs(velocity.x) > abs(velocity.y):
			# movimiento horizontal
			sprite.animation = "walk side"
			sprite.flip_h = velocity.x > 0
			last_dir = Vector2(sign(velocity.x), 0)
		else:
			# movimiento vertical
			if velocity.y > 0:
				sprite.animation = "walk forward"
				last_dir = Vector2(0, 1)
			else:
				sprite.animation = "walk backward"
				last_dir = Vector2(0, -1)
	sprite.play()
