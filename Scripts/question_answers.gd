extends Node

@onready var dialogue_manager: Node = $"/root/CurrentMainScene/Dialogue Manager"
@onready var current_timer
@onready var current_bars
var current_answer = null
var correct_answer : String
var question_number = 1
signal question_attempt_start

func _ready() -> void:
	self.connect("question_attempt_start",dialogue_manager._on_question_change)

func SetQuestion(q_number:int, c_answer:String, c_time: float) -> void:
	question_number = q_number
	correct_answer = c_answer
	current_timer.start(c_time)
