extends Node

var score = 0 
var addscore = 0

@export var totalscore = 0 
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var total_score_label = $CanvasLayer/TotalScoreLabel

func add_point():
	score += 1

func add_extra_point():
	if GameManager.enemy_type == "Wormy":
		addscore += 6
	elif GameManager.enemy_type == "Bear":
		addscore += 11
	elif GameManager.enemy_type == "Crocodile":
		addscore += 15

func _process(delta): #TOTAL POINTS
	totalscore = score + addscore
	GameManager.current_level_score = totalscore
	
	score_label.text = str(score).pad_zeros(2) + "/10"
	#total_score_label.text = "POINTS:" + str(totalscore).pad_zeros(3)
