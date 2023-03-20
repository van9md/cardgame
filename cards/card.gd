extends Node2D
var selected = false
var released = false
var element_top= ""
var intersect = false
#area_top = "Area"
signal  reaction(a,b)
@export var element: String = "element"
@export var color:Color

@export var reactions = []

func _ready():
	get_node("Icon/Area2D/Label").text = element
	get_node("Icon").set_modulate(color)
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(),25*delta)

func _input(event):
	if event is InputEventMouseButton:
		if (event.button_index==MOUSE_BUTTON_LEFT and not event.pressed):
			#print("released")
			selected=false
	print(element, released)
	
func _process(delta):
	pass
func _on_control_gui_input(event):
	if Input.is_action_just_pressed("click"):
		selected = true
		released = false
	if event is InputEventMouseButton:
		if (event.button_index==MOUSE_BUTTON_LEFT and not event.pressed):
			print(element, "released")
			released = true
		


func _on_area_2d_area_entered(area):
	intersect = true
	if selected == false and area.get_parent().get_parent().released == true:
		#area_top= area
		element_top = area.get_node("Label").text
		#print(element, released)
		#print(element_top," entered ", element, selected, released)
		reaction.emit(element,element_top,self,area.get_parent().get_parent())
		#delete element_top on enter
		area.get_parent().get_parent().queue_free()
		


func _on_area_2d_area_exited(area):
	intersect = false
	pass # Replace with function body.
