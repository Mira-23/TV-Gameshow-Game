extends Control

@onready var check_button: CheckButton = $CheckButton
@onready var check_button2: CheckButton = $CheckButton2
@onready var check_button3: CheckButton = $CheckButton3
@onready var check_button4: CheckButton = $CheckButton4
var button_array: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_array = [check_button, check_button2, check_button3, check_button4]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func hide_self():
	self.visible = false

func reveal_self():
	for button in button_array:
		button.button_pressed = false
	self.visible = true

func _on_timer_timeout():
	if(QuestionAnswers.question_number >= 5):
		var pressed_count: int
		for button in button_array:
			if(button.button_pressed):
				pressed_count = pressed_count+1
		var answer_dict = {check_button : "A", check_button2: "B", check_button3: "C", check_button4 : "D"}
		var current_answer = answer_dict.find_key(QuestionAnswers.correct_answer)
		if(!current_answer.button_pressed && pressed_count == 2):
			QuestionAnswers.current_answer = QuestionAnswers.correct_answer
		else:
			QuestionAnswers.current_answer = "False"
