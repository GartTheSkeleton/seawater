extends Node2D

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player")

var _next_map_filepath = "res://levels/homeFloor4.tscn"

var _target_map = preload("res://levels/homeFloor4.tscn")

var _current_map

var chungus

signal delete_current_level


# Called when the node enters the scene tree for the first time.
func _ready():
	_current_map = _target_map.instantiate()
	
	add_child(_current_map)
	
	print(_next_map_filepath.get_file())
	
	_next_map_filepath = "res://levels/genericLevel.tscn"
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_target_map = load(_next_map_filepath)
	
	if Input.is_action_just_pressed("Esc"):
		_change_map(0, 0,)


func _change_map(targetx, targety):
	await get_tree().create_timer(0.2).timeout
	
	delete_current_level.emit()
	
	_current_map = _target_map.instantiate()
	
	add_child(_current_map)
	player.global_position.x = targetx
	player.global_position.y = targety
	
	print("loaded map " + _next_map_filepath)
	
	
