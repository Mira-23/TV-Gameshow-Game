extends Node

@onready var previous_window = DisplayServer.window_get_mode()
@onready var current_window = DisplayServer.window_get_mode()
@onready var MainRoot = $".."
var dialogue_path: String = "res://Dialogues/main.dialogue"
var test_path: String = "res://Dialogues/test.dialogue"

var balloon_scene = load("res://Scenes/balloon.tscn")
var main_dialogue = load(dialogue_path)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
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


func _on_Timer_timeout():
	DialogueManager.show_dialogue_balloon_scene.call_deferred(balloon_scene, main_dialogue, "question_attempt")


func _on_question_change():
	match QuestionAnswers.question_number:
		1: 
			DialogueManager.show_dialogue_balloon_scene.call_deferred(balloon_scene, main_dialogue, "question_1")
		2: 
			DialogueManager.show_dialogue_balloon_scene.call_deferred(balloon_scene, main_dialogue, "question_2")
		3:
			DialogueManager.show_dialogue_balloon_scene.call_deferred(balloon_scene, main_dialogue, "question_3")
		4:
			DialogueManager.show_dialogue_balloon_scene.call_deferred(balloon_scene, main_dialogue, "question_4")
		_: 
			DialogueManager.show_dialogue_balloon_scene.call_deferred(balloon_scene, main_dialogue, "tbc")
