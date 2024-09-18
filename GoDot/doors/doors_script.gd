extends Node

#signal scene_change(scene_name)
var entered_main_door = false
var entered_green_door = false

func _process(delta):
	if entered_main_door == true and Input.is_action_just_pressed("enter"):
		GameManager.current_level_score = 0
		print("entered - now going to level 1 (green)")
		get_tree().change_scene_to_file("res://Level 1 (green)/Level 1.tscn")
	
	if GameManager.current_level_score == 1:
		print("yay")
		if entered_green_door == true and Input.is_action_just_pressed("enter"):
			print("entered - now going to main")
			get_tree().change_scene_to_file("res://main scene (start)/main.tscn")

##tjekke om player er på potalen
#green door - main
func _on_area_2d_green_main_body_entered(body):
	entered_main_door = true
func _on_area_2d_green_main_body_exited(body):
	entered_main_door = false

#green door - level 1
func _on_area_2d_green_level_1_body_entered(body):
	entered_green_door = true
func _on_area_2d_green_level_1_body_exited(body):
	entered_green_door = false
