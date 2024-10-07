extends Button

func _ready():
	visible = false
	get_tree().create_timer(5).timeout
	visible = true

func _pressed():
	get_tree().change_scene_to_file("res://main_scenes/tutroial_scene/MainTutorialScene.tscn")
	GameManager.ingredient_score = 0
	GameManager.total_score = 0
	GameManager.current_level_score = 0
	GameManager.levels_completed = 0
	GameManager.total_time = 0
