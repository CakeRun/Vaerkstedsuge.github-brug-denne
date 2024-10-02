extends Timer

var setCount = 10000
var remaining 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_count():
	start(setCount)
	
func stop_count():
	stop()
	remaining = get_time_left
	GameManager.total_time = setCount - remaining
