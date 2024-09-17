extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var enemy_inattack_range = false 
var enemy_attack_cooldown = true
var health = 6
var player_alive = true 
var attack_ip = false 

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	#enemy_attack()
	#attack()
	
	if health <= 0:
		player_alive = false
		health = 0 
		self.queue_free()

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	
	#flips sprite based on diretion
	if direction > 0:
		if attack_ip == false:
			animated_sprite_2d.flip_h = false
	elif direction < 0:
		if attack_ip == false:
			animated_sprite_2d.flip_h = true 
	
	#plays animation 
	if is_on_floor():
		if direction == 0:
			if attack_ip == false:
				animated_sprite_2d.play("idle")
		else:
			if attack_ip == false:
				animated_sprite_2d.play("run")
	else: 
		animated_sprite_2d.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func player():
	pass
#if body.has_method("player") also to be added to enemies

#determines if enemy is within attack range
#needs method func enemy added to all enemies first before this can be launched
#func _on_player_hitbox_body_entered(body):
#	if body.has_method("enemy"):
#		enemy_inattack_range = true

#func _on_player_hitbox_body_exited(body):
#	if body.has_method("enemy"):
#		enemy_inattack_range = false

#func enemy_attack():
#	if enemy_inattack_range and enemy_attack_cooldown == true:
#		health = health - enemy.damage_ratio
		#use parent and child inheritance nodes to define different enemies and their damage ratios?
#		enemy_attack_cooldown = false 
#		$attack_cooldown.start()

#func _on_attack_cooldown_timeout():
#	enemy_attack_cooldown = true 

#func attack():
#	if Input.is_action_just_pressed("attack"): 
#		attack_ip = true 
#		$AnimatedSprite2D.play("hit")
#		$deal_damage_cooldown.start

#func _on_deal_damage_cooldown_timeout():
#	$deal_damage_cooldown.stop()
#	global.player_current_attack = false
#	attack_ip = false

