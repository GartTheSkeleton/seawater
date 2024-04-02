extends CharacterBody2D

@onready var eyes = $Eyes
@onready var mysprite = $AnimatedSprite2D
@onready var gamecamera = $Camera2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing = Vector2(0,1)

func _process(delta):
	pass

func _physics_process(delta):
	
	z_index = global_position.y
	
	eyes.global_position = global_position + (facing.normalized()*96)
	
	if eyes.active == true:
		
		var directionx = Input.get_axis("ui_left", "ui_right")
		var directiony = Input.get_axis("ui_up", "ui_down")
		if directionx:
			velocity.x = directionx * SPEED
		else:
			velocity.x = 0
		if directiony:
			velocity.y = directiony * SPEED
		else:
			velocity.y = 0
		
		velocity.normalized()
		
		if velocity != Vector2(0,0):
			facing = velocity.normalized()
		
		match facing:
			Vector2(0,1):
				if velocity != Vector2(0,0):
					if mysprite.animation != "WalkDown":
						mysprite.play("WalkDown")
				else:
					mysprite.play("IdleDown")
			Vector2(0,-1):
				if velocity != Vector2(0,0):
					if mysprite.animation != "WalkUp":
						mysprite.play("WalkUp")
				else:
					mysprite.play("IdleUp")
			Vector2(1,0):
				if velocity != Vector2(0,0):
					if mysprite.animation != "WalkRight":
						mysprite.play("WalkRight")
				else:
					mysprite.play("IdleRight")
			Vector2(-1,0):
				if velocity != Vector2(0,0):
					if mysprite.animation != "WalkLeft":
						mysprite.play("WalkLeft")
				else:
					mysprite.play("IdleLeft")
		

		move_and_slide()
