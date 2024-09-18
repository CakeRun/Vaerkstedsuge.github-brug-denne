extends Node

@onready var teleport_audio_main = $"../teleport_audio"
@onready var teleport_audio_green = $"../teleport_audio_green"
var level_number_completed = 0

#signal scene_change(scene_name)
var entered_main_door = false
var entered_green_door = false

func _process(delta):
	#####LEVEL 1#####
	if entered_main_door == true and Input.is_action_just_pressed("enter") and level_number_completed == 0:
		print("entered - now going to level 1")
		teleport_audio_main.play()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://Level 1 (green)/Level 1.tscn")
	
	if GameManager.current_level_score >= 1:
		if entered_green_door == true and Input.is_action_just_pressed("enter"):
			level_number_completed = 1
			print("entered - now going to main")
			teleport_audio_green.play()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://main scene (start)/main.tscn")
	
	#####LEVEL 2#####
	
	
	#####LEVEL 3#####


#####LEVEL 1#####
#green door - main
func _on_area_2d_green_main_body_entered(body):
	entered_main_door = true
func _on_area_2d_green_main_body_exited(body):
	entered_main_door = false

#green door - level1
func _on_area_2d_green_level_1_body_entered(body):
	entered_green_door = true
func _on_area_2d_green_level_1_body_exited(body):
	entered_main_door = false
