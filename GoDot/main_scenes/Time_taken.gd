extends Label

@onready var label_timer = %Label_timer

var total_time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	total_time = int(GameManager.total_time) / 60
	label_timer.text = "TIMER: " + str(total_time).pad_zeros(3) + "minutes"
