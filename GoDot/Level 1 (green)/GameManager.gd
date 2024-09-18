extends Node

var score = 0 
var addscore = 0

@onready var score_label = $CanvasLayer/ScoreLabel

func add_point():
	score += 1
	score_label.text = "Score: " + str(score) + " / 10"

func add_extra_point():
	addscore += 1
	score_label.text = "Score: " + str(score) + " / 10" + " + " + str(addscore)
