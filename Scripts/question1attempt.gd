extends Panel

@onready var timer: Timer = $Timer
@onready var label: Label = $CountDown

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var duration = 5
	if(Input.is_action_just_pressed("ui_up")):
		timer.wait_time = duration
		print("a")
		timer.start()
	if(Input.is_action_just_pressed("test") && !timer.is_stopped()):
			duration = timer.time_left - 10
			timer.stop()
			timer.wait_time = duration
			timer.start()
	label.text = str(round(timer.time_left))
