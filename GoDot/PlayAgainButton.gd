extends Button

func _ready():
	visible = false
	get_tree().create_timer(5).timeout
	visible = true

func _pressed():
	GameManager.ingredient_score = 0
	GameManager.total_score = 0
	GameManager.current_level_score = 0
	GameManager.levels_completed = 0
	GameManager.total_time = 0
	DoorsScript.levels_completed = 0
	
	print(GameManager.ingredient_score)
	print(GameManager.total_score)
	print(GameManager.current_level_score)
	print(GameManager.levels_completed)
	print(GameManager.total_time)
	print(DoorsScript.levels_completed)
	
	get_tree().change_scene_to_file("res://main_scenes/tutroial_scene/MainTutorialScene.tscn")
