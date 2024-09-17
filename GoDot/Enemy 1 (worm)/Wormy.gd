extends Node2D

const SPEED = 30

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var edge_right = $edgeRight
@onready var edge_left = $edgeLeft



func _process(delta):
	if ray_cast_right.is_colliding() or edge_right.is_colliding() == false:
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding() or edge_left.is_colliding() == false:
		direction = 1
		animated_sprite.flip_h = true

	position.x += direction * SPEED * delta 
	

