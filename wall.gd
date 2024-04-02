extends CharacterBody2D

func _ready():
	visible = true

func _process(delta):
	z_index = global_position.y
