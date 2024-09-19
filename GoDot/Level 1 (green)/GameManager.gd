extends Node

var score = 0 
var addscore = 0
@export var totalscore = 0 

@onready var score_label = $CanvasLayer/ScoreLabel
@onready var total_score_label_1 = $CanvasLayer/TotalScoreLabel1
@onready var total_score_label_2 = $CanvasLayer/TotalScoreLabel2
@onready var total_score_label_3 = $CanvasLayer/TotalScoreLabel3


func add_point():
	score += 1
	GameManager.current_level_score += 1
	GameManager.total_score += 1
	score_label.text = str(score).pad_zeros(2) + "/10"

func add_extra_point():
	if GameManager.enemy_type == "Wormy":
		addscore += 6
		GameManager.current_level_score += 6
		GameManager.total_score += 6
	elif GameManager.enemy_type == "Bear":
		addscore += 11
		GameManager.current_level_score += 11
		GameManager.total_score += 11
	elif GameManager.enemy_type == "Crocodile":
		addscore += 15
		GameManager.current_level_score += 15
		GameManager.total_score += 15
	#score_label.text = "Score: " + str(score) + " / 10" + " + " + str(addscore)

func _process(delta): #TOTAL POINTS
	totalscore = score + addscore
	GameManager.current_level_score = totalscore
	score_label.text = str(score).pad_zeros(2) + "/10"

	#total_score_label_1.text = "POINTS:" + str(totalscore).pad_zeros(3)
	#total_score_label_2.text = "POINTS:" + str(totalscore).pad_zeros(3)
	#total_score_label_3.text = "POINTS:" + str(totalscore).pad_zeros(3)
	#total_score_label.text = "POINTS:" + str(totalscore).pad_zeros(2)
