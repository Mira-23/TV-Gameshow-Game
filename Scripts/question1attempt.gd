extends Panel

@onready var timer: Timer = $Timer
@onready var label: Label = $CountDown
@onready var dialogue_manager: Node = $"/root/CurrentMainScene/Dialogue Manager"
@onready var bar_answer_sliders: Panel = $"../BarAnswerSliders"
@onready var check_boxes : Control = $"../QuestionBox/ClickableAnswers"
#mira is gay

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	QuestionAnswers.current_timer = timer
	timer.connect("timeout",dialogue_manager._on_timer_timeout)
	timer.connect("timeout", bar_answer_sliders._on_timer_timeout)
	timer.connect("timeout", check_boxes._on_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = str(round(timer.time_left))
	#var duration = 5
	#if(Input.is_action_just_pressed("ui_up")):
		#timer.wait_time = duration
		#print("a")
		#timer.start()
		
	#if(Input.is_action_just_pressed("test") && !timer.is_stopped()):
			#duration = timer.time_left - 10
			#timer.stop()
			#timer.wait_time = duration
			#timer.start()
