extends CharacterBody2D
var accel = 300
var rocket_scene = preload("res://Scenes/rocket.tscn")
@onready var rocket_container = $RocketContainer

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func _physics_process(delta):
	velocity = Vector2(0,0)

	var viewport = get_viewport_rect().size
	
	if Input.is_action_pressed("move_up"):
		velocity.y = -accel
	if Input.is_action_pressed("move_down"):
		velocity.y = accel
	if Input.is_action_pressed("move_left"):
		velocity.x = -accel
	if Input.is_action_pressed("move_right"):
		velocity.x = accel
	
	move_and_slide()
	global_position = global_position.clamp(Vector2(0,0), viewport)


func shoot():
	
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 75
