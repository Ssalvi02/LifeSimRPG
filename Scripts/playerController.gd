extends CharacterBody2D


const SPEED = 300.0
var lastdir = ''
@onready var anim = get_node("AnimationPlayer")  
@onready var sprite = get_node("Sprite2D")



func _physics_process(delta):
	InputHandler()
	move_and_slide()

func InputHandler():
	var horiz_dir = Input.get_axis("walk_left", "walk_right")
	var vert_dir = Input.get_axis("walk_up", "walk_down")
	
	AnimationHandler()
	
	if horiz_dir:
		velocity.x = horiz_dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if vert_dir:
		velocity.y = vert_dir * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

func AnimationHandler():
	sprite.flip_h = false
	if(velocity.x > 0):
		anim.current_animation = "WalkR"
		lastdir = 'R'
	elif(velocity.x < 0):
		sprite.flip_h = true
		anim.current_animation = "WalkL"
		lastdir = 'L'
	elif(velocity.y < 0):
		anim.current_animation = "WalkUp"
		lastdir = 'U'
	elif(velocity.y > 0):
		anim.current_animation = "WalkDown"
		lastdir = 'D'
	else:
		if(lastdir == "R"):
			anim.current_animation = "IdleR"
		if(lastdir == "L"):
			anim.current_animation = "IdleR"
			sprite.flip_h = true
		if(lastdir == "U"):
			anim.current_animation = "IdleUp"
		if(lastdir == "D"):
			anim.current_animation = "IdleDown"

