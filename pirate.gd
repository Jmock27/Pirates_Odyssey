extends CharacterBody2D
@export var speed = 400.0
@export var jump_velocity = -500.0
@export var score = 0
@export var lives = 5

signal score_updated
signal lives_updated

var hurt = false
var gravity = ("physics/2d/default_gravity")

func _physics_process(delta):
	
	if(hurt):
		$AnimatedSprite2D.play("hurt")
		return

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$JumpSoundPlayer.play()
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if velocity.x!=0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")

	if velocity.x<0:
		$AnimatedSprite2D.flip_h = true;
	elif velocity.x>0:
		$AnimatedSprite2D.flip_h = false;

	move_and_slide()
