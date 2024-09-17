extends Area2D

#@onready var game_manager = %GameManager
#@onready var animation_player = $AnimationPlayer
@onready var pickup_sound = $Ingredient_pickup_sound

func _on_body_entered(body):
	pickup_sound.play()
	await get_tree().create_timer(0.6).timeout
	queue_free()

#POINTS
