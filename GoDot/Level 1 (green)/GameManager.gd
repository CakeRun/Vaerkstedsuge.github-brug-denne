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
	score_label.text = str(score).pad_zeros(2) + "/10"

func add_extra_point():
	if GameManager.enemy_type == "Wormy":
		addscore += 6
	elif GameManager.enemy_type == "Bear":
		addscore += 11
	elif GameManager.enemy_type == "Crocodile":
		addscore += 15
	#score_label.text = "Score: " + str(score) + " / 10" + " + " + str(addscore)

func _process(delta): #TOTAL POINTS
	totalscore = score + addscore
	GameManager.current_level_score = totalscore
<<<<<<< HEAD
	score_label.text = str(score).pad_zeros(2) + "/10"
	print(totalscore)
	
	
	#total_score_label_1.text = "POINTS:" + str(totalscore).pad_zeros(3)
	#total_score_label_2.text = "POINTS:" + str(totalscore).pad_zeros(3)
	#total_score_label_3.text = "POINTS:" + str(totalscore).pad_zeros(3)
=======
	
	#total_score_label.text = "POINTS:" + str(totalscore).pad_zeros(2)
>>>>>>> 4f5552db3d3380ef521acf142059a80ea9282c79
