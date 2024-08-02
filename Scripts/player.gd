extends CharacterBody2D

var move_speed := 100
var jump_speed := 200
var in_air := false

func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
		in_air = true

func move():
	var direction := Input.get_axis("left", "right")
	velocity.x = direction * move_speed

	if !is_on_floor(): 
		velocity.y += 9.8
	elif is_on_floor() and !in_air: 
		velocity.y = 0
	
	move_and_slide()


func _physics_process(_delta):
	move()
	jump()
