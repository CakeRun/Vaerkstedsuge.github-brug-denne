extends Area2D

#@onready var game_manager = %GameManager
#@onready var animation_player = $AnimationPlayer
@onready var pickup_sound = %AudioStreamPlayer2D


@onready var player = %Player

func _on_body_entered(player):
	pickup_sound.play()
	queue_free()

#POINTS
