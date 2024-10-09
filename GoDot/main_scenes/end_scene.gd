extends Node2D

@onready var celebrations = $AudioStreamPlayer2D
@onready var sad = $sad

# Called when the node enters the scene tree for the first time.
func _ready():
	if GameManager.total_score > 30:
		celebrations.play()
	else:
		sad.play()
