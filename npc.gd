extends CharacterBody2D

@onready var mysprite = $AnimatedSprite2D

@export var myText = "timeline01"

func _ready():
	mysprite.animation_finished.connect(animfin)


func _process(delta):
	z_index = global_position.y


func animfin():
	if mysprite.animation != "Idle":
		mysprite.play("Idle")
