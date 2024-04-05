extends Control

@onready var tv_shader : ColorRect = $TVShader
@onready var back_buffer_copy : BackBufferCopy = $BackBufferCopy
@onready var simple_grain : ColorRect = $SimpleGrain
@onready var back_buffer_copy3 : BackBufferCopy = $BackBufferCopy3
@onready var new_vhs : ColorRect = $NewVHS
@onready var back_buffer_copy2 : BackBufferCopy = $BackBufferCopy2
@onready var blur : ColorRect = $Blur

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.z_index = 5
	#var effects_array = [tv_shader, back_buffer_copy, simple_grain, back_buffer_copy3, new_vhs, back_buffer_copy2, blur] 
	#for item in effects_array:
		#item.z_as_relative = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
