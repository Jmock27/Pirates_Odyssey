extends CharacterBody2D
@export var speed = 200.0
@export var jump_velocity = -300.0
@export var score = 0
@export var lives = 5

var damage = 10
var is_attacking = false
var attack_duration = 0.3

signal score_updated
signal lives_updated

var hurt = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func hit():
	lives -= 1
	emit_signal("lives_updated")
	set_modulate(Color(1, .1, .1, .5))
	$Timer.start()
	hurt = true

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
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
	
	
	
	if Input.is_action_pressed("activate_hitbox") and not is_attacking:
		is_attacking = true
	
	
	move_and_slide()

func _on_Attack_animation_finished():
	$Hitbox.visible = false
	$Hitbox.disabled = true

func _on_Hitbox_area_entered(area):
	if area.is_in_group("enemy"):
		area.call_deferred("take_damage", damage)


func _on_finish_area_body_entered(_body):
	call_deferred("scene_change")

func _on_fall_area_body_entered(_body):
	call_deferred("game_over")

func scene_change():
	get_tree().change_scene_to_file("res://gameLevel.tscn")

func game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")
