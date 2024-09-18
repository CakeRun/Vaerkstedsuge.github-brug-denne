extends Node

var player_current_attack = false

var enemy_attack = false 

var enemy_type = "String"

var current_level_score = 0

var total_score = 0

func game_score():
	total_score = total_score + current_level_score
	print(total_score)
