extends Node2D

@onready var world : Node2D = get_tree().get_first_node_in_group("world")


# Called when the node enters the scene tree for the first time.
func _ready():
	world.connect("delete_current_level",_delete_self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _delete_self():
	queue_free()
