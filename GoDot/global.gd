extends Node

var player_current_attack = false

var enemy_attack = false 

var enemy_type = "String"

var total_score = 0

var current_level_score = 0

var levels_completed = 0

@onready var total_score_label_end_small = $TotalScoreLabel_end_small
@onready var total_score_label_end_medium = $TotalScoreLabel_end_medium
@onready var total_score_label_end_big = $TotalScoreLabel_end_big
