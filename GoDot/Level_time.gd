extends Timer

var setCount = 10000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# if GameManager.levels_completed == 0:   #til hvis den skal være forskellig for de tre levels
func start_count():
	start(setCount)
	
func stop_count():
	stop()
	var remaining = get_time_left
	print(remaining, "time left")
	GameManager.total_time = setCount - remaining
	print(GameManager.total_time, "total time spent so far")
