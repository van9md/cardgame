extends Marker2D

@export var spawn_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn():
  # Creates a new instance of the _spawn_scene
	var spawn = spawn_scene.instantiate()

	add_child(spawn)

  # Prevents the Spawner2D transform from affecting the new instance
	#spawn.set_as_toplevel(true)

  # Move the new instance to the Spawner2D position
	spawn.global_position = global_position
