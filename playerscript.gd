extends CharacterBody2D

@export var speed = 300

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):
	
	var horizontal = Input.get_axis("ui_left", "ui_right")
	var vertical = Input.get_axis("ui_up", "ui_down")
	
	
	if horizontal:
		velocity.x = speed * horizontal
	elif vertical:
		velocity.y = speed * vertical
	elif horizontal and vertical:
		velocity = speed 
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	if velocity.y < 0:
		$AnimatedSprite2D.play("MoveUp")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("MoveDown")
	elif velocity.x < 0:
		$AnimatedSprite2D.play("MoveLeft")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("MoveRight")
	
	move_and_slide()



