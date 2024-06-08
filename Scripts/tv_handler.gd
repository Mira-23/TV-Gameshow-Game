extends MeshInstance3D

@onready var area_3d: Area3D = $"../Area3D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_3d.connect("input_event",self._on_area_3d_input_event)
	area_3d.connect("mouse_entered",self._on_area_3d_mouse_entered)


func _on_area_3d_input_event(_camera: Node, event: InputEvent, _position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if(event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true):
			get_tree().change_scene_to_file("res://Scenes/show_set.tscn")


func _on_area_3d_mouse_entered() -> void:
	print("entered!")
