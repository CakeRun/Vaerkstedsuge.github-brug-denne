extends Label

@onready var label_timer = %Label_timer

var total_time = 0
# Called when the node enters the scene tree for the first time.

func _ready():
	total_time = int(GameManager.total_time)
	label_timer.text = "TIMER: " + str(total_time).pad_zeros(3) + " seconds"
	
func _time():
	var minute = floor(total_time / 60)
	var second = int(total_time) % 60
	return [minute, second]

func _process(_delta):
	label_timer.text = "%02d:%02d" % _time()
	
