extends Timer

var setCount = 3600

var remaining = 0

var hoursSpent = 0

var startCount = false

func _process(delta):
	remaining = get_time_left()
	
# if GameManager.levels_completed == 0:   #til hvis den skal være forskellig for de tre levels
func start_count():
	print("starter timer 1")
	start(setCount)
	startCount = true
	
func stop_count():
	print("stopper timer 1")
	stop()
	print(remaining, "time left")
	GameManager.total_time += 3600 - remaining
	print(GameManager.total_time, "total time spent so far")
	queue_free()
