extends CharacterBody2D

@export var speed = 300
@onready var Rocket = preload("res://scenes/rocket.tscn")

func _ready():
	State.lifes_changed.connect(func (v):
		if v==0:
			queue_free()
	)

func _physics_process(delta) -> void:
	var v = Vector2(0, 0)
	if Input.is_action_pressed("move_left"):
		v.x=-speed
	if Input.is_action_pressed("move_right"):
		v.x=speed
	if Input.is_action_pressed("move_up"):
		v.y=-speed
	if Input.is_action_pressed("move_down"):
		v.y=speed
	velocity = v
	move_and_slide()
	global_position.x=clamp(0, global_position.x, get_viewport_rect().size.x)
	global_position.y=clamp(0, global_position.y, get_viewport_rect().size.y)

	if Input.is_action_just_pressed("shoot"):
		var rocket = Rocket.instantiate()
		rocket.global_position = global_position
		rocket.global_position.x+=70
		get_parent().add_child(rocket)
		$sound.play()
