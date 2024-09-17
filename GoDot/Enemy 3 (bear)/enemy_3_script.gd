extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player = $Player/CollisionShape2D

var speed = 100
var player_status = ""

func _ready():
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
		#var t = randf_range(0,1)
		#get_tree().create_timer(t).timeout
		
		animated_sprite_2d.play("attack")
		
	elif player_status == "asleep":
		#animated_sprite_2d.play("falling_asleep")
		animated_sprite_2d.play("sleeping")

func _on_detection_area_body_entered(player):
	player_status = "chase"

func _on_detection_area_body_exited(player):
	player_status = "asleep"
	
func _on_attack_area_body_entered(player):
	player_status = "attack"

func _on_attack_area_body_exited(player):
	player_status = "chase"
