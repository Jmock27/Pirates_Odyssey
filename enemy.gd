extends CharacterBody2D

@export var speed = 100
var direction = -1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	velocity.x = speed * direction
	
	if(direction == -1):
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true

	move_and_slide()
	
	if $RayCast2D.is_colliding()==false:
		direction *= -1
		$RayCast2D.position.x *= -1

func _on_collision_checker_body_entered(body):
	print("_on_collision_checker_body_entered")
	body.hit()
