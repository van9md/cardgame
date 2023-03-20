extends Node2D
var selected = false
var released = false
var element_top= ""
var intersect = false
var area_top = "Area"
#var level = self.get_parent()
#var card := preload("res://cards/card.tscn")
var card
signal  reaction(a,b)
@export var element: String = "element"
@export var color:Color

@export var reactions = {}

func _ready():
	
	get_node("Icon/Area2D/Label").text = element
	get_node("Icon").set_modulate(color)
	
func _physics_process(delta):
	#move card with delay
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(),25*delta)

func _process(delta):
	var level = self.get_parent()
	check_drop()
		
func _on_control_gui_input(event):
	if Input.is_action_just_pressed("click"):
		selected = true
		released = false
		print(element, " clicked!")
		print("my reaction is: ", reactions )
	if Input.is_action_just_released("click"):
		released = true
		selected = false
		print(element, " released")
		

func _on_area_2d_area_entered(area):
	if selected == false:
		element_top = area.get_node("Label").text
		print(element_top, " ENTERED ", element)
		area_top= area
		intersect = true
		
func _on_area_2d_area_exited(area):
	intersect = false
	
func check_drop():
	if selected == false and intersect == true and area_top.get_parent().get_parent().released == true:
		#custom signal
		#reaction.emit(element,element_top,self,area_top.get_parent().get_parent())
		#delete if it any reaction
		if element_top in reactions:
			#delete element_top on enter
			area_top.get_parent().get_parent().queue_free()
			#create new card from reactions
			create_new_card()
			self.queue_free()
			
		
func create_new_card():
	var card = self.get_parent().card_scene.instantiate()
	card.element=reactions[element_top]
	card.color = Color(1, 1, 1, 1)
	card.global_position=get_global_mouse_position()
	self.get_parent().add_child(card)
		



