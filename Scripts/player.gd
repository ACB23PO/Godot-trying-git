extends CharacterBody2D

const move_speed := 80
const jump_speed := 9999999

func jump(delta):
	velocity += Vector2.UP * jump_speed * delta

func move(delta):
	if Input.is_action_pressed("left"):
		velocity += Vector2.LEFT * move_speed * delta
	elif Input.is_action_pressed("right"):
		velocity += Vector2.RIGHT * move_speed * delta
	elif Input.is_action_just_pressed("jump"):
		jump(delta)	
	else:
		velocity = Vector2.DOWN * 5000 * delta
	
	move_and_slide()

func _physics_process(delta):
	move(delta)
