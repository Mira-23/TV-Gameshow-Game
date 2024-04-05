extends Control

@onready var label_a : Label = $QuestionBox/ProposA/LabelA
@onready var label_b : Label = $QuestionBox/ProposB/LabelB
@onready var label_c : Label = $QuestionBox/ProposC/LabelC
@onready var label_d : Label = $QuestionBox/ProposD/LabelD
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var labels_array = [label_a, label_b, label_c, label_d]
	
	for label in labels_array:
		label.z_index = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
		
