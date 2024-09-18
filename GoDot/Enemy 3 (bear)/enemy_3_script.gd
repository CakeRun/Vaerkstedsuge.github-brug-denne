extends CharacterBody2D

@onready var bear = $AnimatedSprite2D
@onready var player = $"../CharacterBody2D" #muligvis ikke vores player

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
	bear_status = "attack"

func _on_attack_area_body_exited(player):
	bear_status = "chase"
