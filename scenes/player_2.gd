extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var shadow: Sprite2D = $shadow


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var current_wind_force: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	# Add animation
	if velocity.x > 1 or velocity.x < -1:
		animated_sprite_2d.animation = "walk"
	else:
		animated_sprite_2d.animation = "idle"
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		shadow.visible = false
	else:
		shadow.visible = true

	# Handle jump.
	if Input.is_action_just_pressed("jump2") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	
	var direction := Input.get_axis("move_left2", "move_right2")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	velocity += current_wind_force * delta
	
	move_and_slide()
	
	
	if direction == 1.0 :
		animated_sprite_2d.flip_h = false
	elif direction == -1.0:
		animated_sprite_2d.flip_h = true

func set_wind_force(force: Vector2) -> void:
	current_wind_force = force
