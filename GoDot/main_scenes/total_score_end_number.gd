extends Label

@onready var total_score_end_small = %total_score_end_small
@onready var total_score_end_medium = %total_score_end_medium
@onready var total_score_end_big = %total_score_end_big

func _ready():
	if GameManager.total_score <= 3 and GameManager.total_score >= 1:
		total_score_end_small.text = str(GameManager.total_score).pad_zeros(3)
	if GameManager.levels_completed <= 6  and GameManager.total_score > 3:
		total_score_end_medium.text = str(GameManager.total_score).pad_zeros(3)
	if GameManager.levels_completed  >= 9 and GameManager.total_score > 6:
		total_score_end_big.text = str(GameManager.total_score).pad_zeros(3)
