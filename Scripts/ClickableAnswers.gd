extends Control

@onready var check_button: CheckButton = $CheckButton
@onready var check_button2: CheckButton = $CheckButton2
@onready var check_button3: CheckButton = $CheckButton3
@onready var check_button4: CheckButton = $CheckButton4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func hide_self():
	self.visible = false

func reveal_self():
	self.visible = true

func _on_timer_timeout():
	if(QuestionAnswers.question_number >= 6):
		var correct_answers = QuestionAnswers.correct_answer.split(" ")
		var answer_dict = {check_button : "A", check_button2: "B", check_button3: "C", check_button4 : "D"}
		var corr_answer1 = correct_answers[0]
		var corr_answer2 = correct_answers[1]
		var current_answer1 = answer_dict.find_key(corr_answer1)
		var current_answer2 = answer_dict.find_key(corr_answer2)
		if(current_answer1.button_pressed && current_answer2.button_pressed):
			QuestionAnswers.current_answer = QuestionAnswers.correct_answer
		else:
			QuestionAnswers.current_answer = "False"
