extends Node

@onready var previous_window = DisplayServer.window_get_mode()
@onready var current_window = DisplayServer.window_get_mode()
@onready var MainRoot = $".."
var dialogue_path: String = "res://Dialogues/main.dialogue"
var test_path: String = "res://Dialogues/test.dialogue"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#var dialogue_balloon = preload("res://Scenes/balloon.tscn")
	#dialogue_balloon = dialogue_balloon.instance()
	#MainRoot.add_child(dialogue_balloon)
	#DialogueManager.show_dialogue_balloon(load("res://Dialogues/main.dialogue"), "question_1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:	
	if Input.is_action_just_pressed("ui_down"):
		DialogueManager.show_dialogue_balloon(load("res://Dialogues/main.dialogue"), "question_1")
	if Input.is_action_just_pressed("toggle_fullscreen"):
		current_window = DisplayServer.window_get_mode()
		if current_window != DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			previous_window = current_window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		else:
			if previous_window == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
				previous_window = DisplayServer.WINDOW_MODE_MAXIMIZED
			DisplayServer.window_set_mode(previous_window)
