extends Node2D

@onready var celebrations = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	celebrations.play()
