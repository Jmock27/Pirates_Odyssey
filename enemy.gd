extends CharacterBody2D

var speed = 300
var health = 10
var direction = -1

func _ready():
	pass
	



func _process(delta):
	velocity.x = speed * direction
	
	if(direction == -1):
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true

	move_and_slide()

func _on_collision_checker_body_entered(body):
	print("_on_collision_checker_body_entered")
	body.hit()


func take_damage(damage):
	health -= damage
	if health <= 0:
		die()

func die():
	queue_free()
