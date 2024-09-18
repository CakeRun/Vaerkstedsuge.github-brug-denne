extends Node

#signal scene_change(scene_name)
var entered = false
@export var scene_name = "world"

func _process(delta):
	if entered == true:
		#var scene_name = "level_1"
		if Input.is_action_just_pressed("ui_accept"):
			print("scene skift!")
			emit_signal("scene_change", scene_name)

##tjekke om player er på potalen

#green door - main
func _on_area_2d_green_main_body_entered(body:PhysicsBody2D):
	entered = true
func _on_area_2d_green_main_body_exited(body:PhysicsBody2D):
	entered = false

#green door - level 1
func _on_area_2d_green_level_1_body_entered(body:PhysicsBody2D):
	entered = true
func _on_area_2d_green_level_1_body_exited(body:PhysicsBody2D):
	entered = false
