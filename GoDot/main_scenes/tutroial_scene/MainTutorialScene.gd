extends Node2D

@onready var label_door = $txt/Label_door

# Called when the node enters the scene tree for the first time.
func _ready():
	label_door.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	label_door.visible = true

func _on_area_2d_body_exited(body):
	label_door.visible = false
