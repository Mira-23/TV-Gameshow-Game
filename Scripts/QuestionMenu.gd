extends Control

@onready var bar_answer_sliders: Control = $BarAnswerSliders

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("ui_cancel")):
		bar_answer_sliders.set_process(false)
		bar_answer_sliders.hide()
