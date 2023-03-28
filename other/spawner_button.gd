extends Button
@export var spawn_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	get_node("Spawner2D").spawn_scene = spawn_scene
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	#print(spawn_scene)
	get_node("Spawner2D").spawn()
