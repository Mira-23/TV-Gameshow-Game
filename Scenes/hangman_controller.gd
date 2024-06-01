extends Control

@onready var letter_1: Label = $Background/Cell1/Letter1
@onready var letter_2: Label = $Background/Cell2/Letter2
@onready var letter_3: Label = $Background/Cell3/Letter3
@onready var letter_4: Label = $Background/Cell4/Letter4
@onready var letter_5: Label = $Background/Cell5/Letter5
@onready var letter_6: Label = $Background/Cell6/Letter6

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

var lives = 5

func _input(event):
	if (QuestionAnswers.question_number == 12):
		var letter = event.as_text()
		if(Input.is_anything_pressed() == true && alphabet.has(letter)):
				if(correct_dict.keys().has(letter)):
						correct_dict[letter].text = letter
				else:
					lives-=1
					print("Wrong letter! Lives remaining: ", lives)
				alphabet.remove_at(alphabet.find(letter,0))
