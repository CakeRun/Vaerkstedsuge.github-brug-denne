extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var speed = 100
var player = null
var player_status = ""

func _physics_process(delta):
	if player_status == "":
		animated_sprite_2d.play("sleeping")
	
	if player_status == "chase": #and position.x <= (max x koordinat for platform) and position.x >= (min koordinat for platform)
		#animated_sprite_2d.play("waking_up")
		
		position.x += (player.position.x - position.x)/speed
		animated_sprite_2d.play("walking")
		
		if (player.position.x - position.x) > 0:
			animated_sprite_2d.flip_h = true 
		else:
			animated_sprite_2d.flip_h = false 
	
	elif player_status == "attack":
		#animerer attack efter et tilfædigt stykke tid mellem 0 og 1 sekund
		var t = randf_range(0,1)
		get_tree().create_timer(t).timeout
		animated_sprite_2d.play("attack")
		
		#SKADE vent med det
		#spiller skal skal tage skade hvis hun staidgvæk er i status attack når animationen er færdig (ved timeout)
		
	elif player_status == "asleep":
		#animated_sprite_2d.play("falling_asleep")
		animated_sprite_2d.play("sleeping")

func _on_detection_area_body_entered(body):
	player = body
	player_status = "chase"

func _on_detection_area_body_exited(body):
	player = null
	player_status = "asleep"
	
func _on_attack_area_body_entered(body):
	player_status = "attack"

func _on_attack_area_body_exited(body):
	player_status = "chase"
