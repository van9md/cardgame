extends Node

var card2 = preload("res://cards/card.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var card_new = Globals_scene.card.instantiate()
	add_child(card_new)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
