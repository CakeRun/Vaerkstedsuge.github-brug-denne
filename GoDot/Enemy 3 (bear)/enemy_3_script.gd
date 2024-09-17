extends CharacterBody2D

@onready var bear = $AnimatedSprite2D
@onready var player = $Player

var speed = 200
var player_status = ""

var is_body_entered = false
var wakeup = false

func _ready():
	if player_status == "" and is_body_entered == false:
		bear.play("sleeping")

func _physics_process(delta):
	#collision boy yderst 
	if player_status == "wakeup" and is_body_entered == true:
		wakeup = true 
	
		if wakeup == true:
			bear.play("waking_up")
			await get_tree().create_timer(1).timeout
			bear.play("idle")
			wakeup = false 
	
	elif player_status == "fall_asleep":
		bear.play("falling_asleep")
		await get_tree().create_timer(1).timeout
		bear.play("sleeping")
		
	
	#collision shape imellem 
	if player_status == "chase": #and position.x <= (max x koordinat for platform) and position.x >= (min koordinat for platform)	
		position.x += (player.position.x - position.x)/speed
		bear.play("walking")
		
		if (player.position.x - position.x) > 0:
			bear.flip_h = true 
		else:
			bear.flip_h = false 
	
	elif player_status == "idle":
		bear.play("idle")
	
	#collision shape midterst	
	if player_status == "attack":
		#animerer attack efter et tilfædigt stykke tid mellem 0 og 1 sekund
		#var t = randf_range(0,1)
		#get_tree().create_timer(t).timeoutbear.play("attack")
		bear.play("attack")

	
#yderste collision - wake up detector
func _on_wakeup_area_body_entered(player):
	player_status = "wakeup"
	is_body_entered = true
	print("wakey")

func _on_wakeup_area_body_exited(player):
	player_status = "fall_asleep"
	is_body_entered = false
	print("sleepy")

#midterste collision - chase detector
func _on_detection_area_body_entered(player):
	player_status = "chase"

func _on_detection_area_body_exited(player):
	player_status = "idle"


#inderste collision - attack detector
func _on_attack_area_body_entered(player):
	player_status = "attack"

func _on_attack_area_body_exited(player):
	player_status = "chase"
