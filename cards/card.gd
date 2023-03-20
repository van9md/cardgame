extends Node2D
var selected = false
var element_top= ""
@export var element: String = "element"
@export var color:Color


func _ready():
	get_node("Icon/Area2D/Label").text = element
	get_node("Icon").set_modulate(color)
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(),25*delta)

func _input(event):
	if event is InputEventMouseButton:
		if (event.button_index==MOUSE_BUTTON_LEFT and not event.pressed):
			selected=false

#
func _on_control_gui_input(event):
	if Input.is_action_just_pressed("click"):
		selected = true


func _on_area_2d_area_entered(area):
	if selected == false:
		element_top = area.get_node("Label").text
		print(element_top," entered ", element)
