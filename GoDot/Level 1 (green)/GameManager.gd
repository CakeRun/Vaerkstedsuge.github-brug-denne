extends Node

var score = 0 
var addscore = 0
var totalscore = 0 

@onready var score_label = $CanvasLayer/ScoreLabel
@onready var total_score_label = $CanvasLayer/TotalScoreLabel

func add_point():
	score += 1
	score_label.text = str(score).pad_zeros(2) + "/10"

func add_extra_point():
	if GameManager.enemy_type == "Wormy":
		addscore += 5
	elif GameManager.enemy_type == "Bear":
		addscore += 10
	elif GameManager.enemy_type == "Crocodile":
		addscore += 25
	#score_label.text = "Score: " + str(score) + " / 10" + " + " + str(addscore)

func _process(delta): #TOTAL POINTS
	totalscore = score + addscore
	GameManager.current_level_score = totalscore
	
	#total_score_label.text = "POINTS:" + str(totalscore).pad_zeros(2)
