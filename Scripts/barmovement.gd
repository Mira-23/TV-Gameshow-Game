extends Panel

@onready var progress_bar_a: ProgressBar = $ProgressBar
@onready var progress_bar_b: ProgressBar = $ProgressBar2
@onready var progress_bar_c: ProgressBar = $ProgressBar3
@onready var progress_bar_d: ProgressBar = $ProgressBar4

#var a = progress_bar_a
var bar_array : Array
var rng = RandomNumberGenerator.new()
var upper_value: int
var lower_value: int
var rand_values_array = [rng.randi_range(20,70),rng.randi_range(20,70),rng.randi_range(20,70),rng.randi_range(20,70)]
var bar_speed: float = 60
var answer_speed: float = 40

func _ready() -> void:
	bar_array = [progress_bar_a, progress_bar_b, progress_bar_c, progress_bar_d]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	on_answer_press("answer_a", progress_bar_a)
	on_answer_press("answer_b", progress_bar_b)
	on_answer_press("answer_c", progress_bar_c)
	on_answer_press("answer_d", progress_bar_d)
	
	for i in 4:
		bar_moving(delta, bar_array[i], rand_values_array[i])

func reshuffle():
	rand_values_array = [rng.randi_range(20,70),rng.randi_range(20,70),rng.randi_range(20,70),rng.randi_range(20,70)]
	for i in 4:
		bar_array[i].value = 0

func stop_bars() -> void:
	self.set_process(false)
	self.hide()

func show_bars() -> void:
	reshuffle()
	self.set_process(true)
	self.show()

#replace with tween
func bar_moving(delta, progress_bar: ProgressBar, rand_value: int) -> void:
	var raise: int = 1
	if(progress_bar.value >= rand_value):
		raise = -1
	progress_bar.value += raise * delta * bar_speed
	#var tween = create_tween()
	#tween.set_loops(60)
	#upper_value = rng.randi_range(40,60)
	#lower_value = rng.randi_range(10,30)
	#tween.tween_property(progress_bar, "value", upper_value, 1)
	#print(upper_value)
	#tween.tween_property(progress_bar, "value", lower_value, 1)
	
func on_answer_press(action: String, progress_bar: ProgressBar) -> void:
	if(Input.is_action_just_pressed(action)):
		progress_bar.value += answer_speed
		for bar in bar_array:
			bar.value -= (answer_speed/2)
		
func _on_timer_timeout() -> void:
	if (QuestionAnswers.question_number <= 4):
		var answer_dict = {"A": progress_bar_a.value, "B": progress_bar_b.value, "C": progress_bar_c.value, "D": progress_bar_d.value}
		var answer = answer_dict.find_key(max(progress_bar_a.value,progress_bar_b.value,progress_bar_c.value, progress_bar_d.value))
		QuestionAnswers.current_answer = answer
		print("answer ", answer)
