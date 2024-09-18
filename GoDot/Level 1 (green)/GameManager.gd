extends Node

var score = 0 
var addscore = 0

var totalscore = 0 

@onready var score_label = $CanvasLayer/ScoreLabel

func add_point():
	score += 1
	score_label.text = "Score: " + str(score) + " / 10"
	print("you collected one thing")

func add_extra_point():
	if GameManager.enemy_type == "Wormy":
		addscore += 1
	elif GameManager.enemy_type == "Crocodile":
		addscore += 2
	elif GameManager.enemy_type == "Bear":
		addscore += 3
	score_label.text = "Score: " + str(score) + " / 10" + " + " + str(addscore)

func total_points(delta):
	totalscore = score + addscore
	GameManager.current_level_score = totalscore
