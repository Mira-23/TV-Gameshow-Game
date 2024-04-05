extends Node

@onready var previous_window = DisplayServer.window_get_mode()
@onready var current_window = DisplayServer.window_get_mode()
var dialogue_path: String = "res://Dialogues/main.dialogue"
var test_path: String = "res://Dialogues/test.dialogue"

@onready var clickable_answers : Control = $"../DialogueMenuLayer/DialogueMenu/QuestionBox/ClickableAnswers"

var balloon_scene = load("res://Scenes/balloon.tscn")
var main_dialogue = load(dialogue_path)

var time_needed : int = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#QuestionAnswers.current_bars.stop_bars()
	QuestionAnswers.SetQuestion(2,"B",time_needed)
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


func _on_timer_timeout():
	var current_dialogue = $"../ExampleBalloon"
	current_dialogue.queue_free()
	
	if (QuestionAnswers.current_answer == "B"):
		print("yes")
	DialogueManager.show_dialogue_balloon(main_dialogue, "question_attempt")


func _on_question_change():
	match QuestionAnswers.question_number:
		0, 1: 
			QuestionAnswers.SetQuestion(2,"B",time_needed)
			DialogueManager.show_dialogue_balloon(main_dialogue, "question_1")
		2: 
			QuestionAnswers.SetQuestion(3,"C",time_needed)
			DialogueManager.show_dialogue_balloon(main_dialogue, "question_2")
		3:
			QuestionAnswers.SetQuestion(4,"A",time_needed)
			DialogueManager.show_dialogue_balloon(main_dialogue, "question_3")
		4:
			QuestionAnswers.SetQuestion(5,"D",time_needed)
			DialogueManager.show_dialogue_balloon(main_dialogue, "question_4")
		5:
			QuestionAnswers.SetQuestion(6,"A B",time_needed)
			DialogueManager.show_dialogue_balloon(main_dialogue, "question_5")
			QuestionAnswers.current_bars.stop_bars()
			clickable_answers.reveal_self()
		_: 
			DialogueManager.show_dialogue_balloon_scene.call_deferred(balloon_scene, main_dialogue, "tbc")
	#QuestionAnswers.current_bars.stop_bars()
