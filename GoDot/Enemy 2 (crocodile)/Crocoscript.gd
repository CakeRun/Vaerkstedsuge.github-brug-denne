extends CharacterBody2D

const speed_norm = 30
const speed_chase = 60
var direction = 1
var chase = false
var player = null


@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var edge_right = $edgeRight
@onready var edge_left = $edgeLeft
@onready var animated_sprite = $AnimatedSprite2D


func _process(delta):
	if ray_cast_right.is_colliding() or edge_right.is_colliding() == false:
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding() or edge_left.is_colliding() == false:
		direction = 1
		animated_sprite.flip_h = true
	if chase:
		position.x += ((player.position.x - position.x)/speed_chase)
		if player.position.x < position.x:
			animated_sprite.flip_h = false
		elif player.position.x > position.x:
			animated_sprite.flip_h = true
	else:
		position.x += direction * speed_norm * delta 





func _on_area_2d_body_entered(body):
	chase = true
	player = body
	print("you're being hunted")

func _on_area_2d_body_exited(body):
	chase = false
	player = null

