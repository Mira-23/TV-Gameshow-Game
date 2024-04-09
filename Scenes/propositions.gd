extends Control

@onready var label_a : Label = $ProposA/LabelA
@onready var label_b : Label = $ProposB/LabelB
@onready var label_c : Label = $ProposC/LabelC
@onready var label_d : Label = $ProposD/LabelD

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var labels_array = [label_a, label_b, label_c, label_d]
	
	for label in labels_array:
		label.z_index = 2

func show_propositions(proposition_a: String, proposition_b: String, proposition_c: String, proposition_d: String):
	label_a.text = "A: " + proposition_a
	label_b.text = "B: " + proposition_b
	label_c.text = "C: " + proposition_c
	label_d.text = "D: " + proposition_d
	self.show()

func hide_propositions():
	self.hide()
