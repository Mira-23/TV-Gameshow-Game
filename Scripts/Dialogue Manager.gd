extends Node

@onready var previous_window = DisplayServer.window_get_mode()
@onready var current_window = DisplayServer.window_get_mode()
var dialogue_path: String = "res://Dialogues/main.dialogue"
var test_path: String = "res://Dialogues/test.dialogue"

@onready var clickable_answers : Control = $"../DialogueMenuLayer/DialogueMenu/QuestionBox/ClickableAnswers"
@onready var current_bars : Panel = $"../DialogueMenuLayer/DialogueMenu/BarAnswerSliders"
@onready var current_propositions : Node = $"../DialogueMenuLayer/DialogueMenu/QuestionBox/Propositions"

var balloon_scene = load("res://Scenes/balloon.tscn")
var main_dialogue = load(dialogue_path)

var time_needed : int = 99


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#QuestionAnswers.current_bars.stop_bars()
	current_propositions.show_propositions("London","Paris","Berlin","Madrid")
	QuestionAnswers.SetQuestion(9,"B",time_needed)
	DialogueManager.show_dialogue_balloon_scene.call_deferred(balloon_scene, main_dialogue, "question_1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:	
	if Input.is_action_just_pressed("toggle_fullscreen"):
		current_window = DisplayServer.window_get_mode()
		if current_window != DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			previous_window = current_window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		else:
			if previous_window == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
				previous_window = DisplayServer.WINDOW_MODE_MAXIMIZED
			DisplayServer.window_set_mode(previous_window)


func hide_question_menu():
	current_bars.stop_bars()
	current_propositions.hide_propositions()
	clickable_answers.hide_self()

func show_question_menu():
	current_bars.show_bars()


func _on_timer_timeout():
	var current_dialogue = $"../ExampleBalloon"
	current_dialogue.queue_free()
	DialogueManager.show_dialogue_balloon(main_dialogue, "question_attempt")
	hide_question_menu()


func _on_question_change():
	show_question_menu()
	DialogueManager.show_dialogue_balloon(main_dialogue, "question_" + str(QuestionAnswers.question_number))
	match QuestionAnswers.question_number:
		5,6,7,8:
			current_bars.stop_bars()
			clickable_answers.reveal_self()
		9,10:
			current_bars.stop_bars()
			hide_question_menu()
	
	match QuestionAnswers.question_number:
		0, 1: 
			current_propositions.show_propositions("London","Paris","Berlin","Madrid")
			QuestionAnswers.SetQuestion(1,"B",time_needed)
		2: 
			current_propositions.show_propositions("Tomato","Onion","Avocado","Lettuce")
			QuestionAnswers.SetQuestion(2,"C",time_needed)
		3:
			current_propositions.show_propositions("Mars","Jupiter","Venus","Saturn")
			QuestionAnswers.SetQuestion(3,"A",time_needed)
		4:
			current_propositions.show_propositions("NaCl","O2","CO2","H2O")
			QuestionAnswers.SetQuestion(4,"D",time_needed)
		5:
			#C
			current_propositions.show_propositions("Bangkok","Beijing","Tokyo","Seoul")
			QuestionAnswers.SetQuestion(5,"C",time_needed)
		6:
			#A
			current_propositions.show_propositions("Lion","Elephant","Tiger","Giraffe")
			QuestionAnswers.SetQuestion(6,"A",time_needed)
		7:
			#B
			current_propositions.show_propositions("Mount Rila","Mount Everest","Mount Kilimanjaro","Mount Fuji")
			QuestionAnswers.SetQuestion(7,"B",time_needed)
		8:
			#D
			current_propositions.show_propositions("Emily Brontë","Charles Dickens","Jane Austen","William Shakespeare")
			QuestionAnswers.SetQuestion(8,"D",time_needed)
		9:
			QuestionAnswers.current_answer = "None"
		_: 
			DialogueManager.show_dialogue_balloon_scene.call_deferred(balloon_scene, main_dialogue, "tbc")
