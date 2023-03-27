extends Node2D

@export var  element:String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var card = preload("res://cards/card.gd")
	var card_instance = card.instantiate()
	get_parent().add_child(card_instance)
	pass # Replace with function body.
