extends Sprite2D

@onready var colissionCheck = $Area2D

@onready var dialogueDisplay : Node2D = get_tree().get_first_node_in_group("dialogue")

var active = true
var resetActive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if colissionCheck.get_overlapping_bodies() and active == true:
		if colissionCheck.get_overlapping_bodies()[0].is_in_group("NPC"):
			if colissionCheck.get_overlapping_bodies()[0].mysprite.animation != "Active":
				colissionCheck.get_overlapping_bodies()[0].mysprite.play("Active")
		if Input.is_action_just_pressed("Space"):
			if colissionCheck.get_overlapping_bodies()[0].is_in_group("NPC") or colissionCheck.get_overlapping_bodies()[0].is_in_group("Object"):
				active = false
				Dialogic.timeline_ended.connect(ended)
				Dialogic.VAR.set("playerName",  "Peepee Head")
				Dialogic.start(colissionCheck.get_overlapping_bodies()[0].myText)
	if resetActive == true:
		active = true
		resetActive = false

func ended():
	resetActive = true
