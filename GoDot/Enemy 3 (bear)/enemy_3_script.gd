extends CharacterBody2D

@onready var bear = $AnimatedSprite2D
@onready var player = $"../CharacterBody2D" #muligvis ikke vores player

var health = 3
var player_inattack_zone = false
var enemy_attack_cooldown = true

@onready var game_manager = %GameManager

var speed = 200
var bear_status = "sleeping"

func _physics_process(delta):
	#collision boy yderst 
	print (bear_status)
	
	if bear_status == "sleeping":
		bear.play("sleeping")
		
	elif bear_status == "wakeup":
		bear_status=""
		bear.play("waking_up")
		await get_tree().create_timer(1).timeout
		bear.play("idle")


	elif bear_status == "fall_asleep":
		bear_status=""
		bear.play("falling_asleep")
		await get_tree().create_timer(1).timeout
		bear.play("sleeping")
		bear_status="sleeping"
		
	#collision shape imellem 
	elif bear_status == "chase": #and position.x <= (max x koordinat for platform) and position.x >= (min koordinat for platform)	
		#position.x += (player.position.x - position.x)/speed
		
		bear.play("walking")
		
		if player.position.x <= position.x:
			position.x-= 1
		else:
			position.x += 1
		
		var threshold = 0.5
		if abs(player.position.x - position.x) > threshold:
			if (player.position.x - position.x) > 0:
				bear.flip_h = true 
			elif (player.position.x - position.x) < 0:
				bear.flip_h = false 
		else:
			bear.play("idle")
	

	elif bear_status == "attack":
		
		var t = randf_range(0,1)
		
		if t<=0.05 : #2% change for at der angribes
			bear.play("attacking")
			await get_tree().create_timer(1).timeout

func _on_detection_area_body_entered(player):
	if bear_status=="":
		bear_status = "chase"

func _on_detection_area_body_exited(player):
		bear_status = ""
		bear.play("idle")
	
func _on_wakeup_area_body_entered(player):
	if bear_status == "sleeping":
		bear_status = "wakeup"

func _on_wakeup_area_body_exited(player):
	bear_status = "fall_asleep"

func _on_attack_area_body_entered(player):
	if player.has_method("player"):
		player_inattack_zone = true

func _on_attack_area_body_exited(player):
	if player.has_method("player"):
		player_inattack_zone = false

func enemy_attack():
	if player_inattack_zone and enemy_attack_cooldown == true:
		GameManager.enemy_type = "Bear" 
		GameManager.enemy_attack = true 
		bear_status = "attack"
		enemy_attack_cooldown = false 
		await get_tree().create_timer(0.02).timeout #til at sikre, at vi dør ikke konstant
		GameManager.enemy_attack = false
		await get_tree().create_timer(1).timeout
		enemy_attack_cooldown = true
	elif player_inattack_zone == false:
		bear_status = "chase"

func deal_with_damage():
	if player_inattack_zone and GameManager.player_current_attack == true:
		health = health - 1
		await get_tree().create_timer(0.5).timeout #her dør den ikke med det samme
		print("enemy health - 1")
		if health <= 0: 
			GameManager.enemy_type = "Bear"
			game_manager.add_extra_point()
			self.queue_free()
