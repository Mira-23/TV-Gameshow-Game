extends Control

@onready var letter_1: Label = $Background/Cell1/Letter1
@onready var letter_2: Label = $Background/Cell2/Letter2
@onready var letter_3: Label = $Background/Cell3/Letter3
@onready var letter_4: Label = $Background/Cell4/Letter4
@onready var letter_5: Label = $Background/Cell5/Letter5
@onready var letter_6: Label = $Background/Cell6/Letter6

@onready var heart_1: Panel = $Background/Heart1
@onready var heart_2: Panel = $Background/Heart2
@onready var heart_3: Panel = $Background/Heart3


var correct_dict
var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]


func _ready() -> void:
	QuestionAnswers.guess_the_word = self
	
	correct_dict = {
		"A" : letter_1
		, "S" : letter_2
		, "H" : letter_3
		, "L" : letter_4
		, "E" : letter_5
		, "Y" : letter_6
	}

var lives = 3

func _input(event):
	if(Input.is_anything_pressed() == true && event.as_text() == "Down"):
		get_tree().change_scene_to_file("res://Scenes/room.tscn")
	if (QuestionAnswers.question_number == 12):
		var letter = event.as_text()
		if(Input.is_anything_pressed() == true && alphabet.has(letter)):
				if(correct_dict.keys().has(letter)):
						correct_dict[letter].text = letter
				else:
					lives-=1
					match lives:
						2:
							heart_1.visible = false
						1:
							heart_2.visible = false
						0:
							heart_3.visible = false
					print("Wrong letter! Lives remaining: ", lives)
				alphabet.remove_at(alphabet.find(letter,0))
