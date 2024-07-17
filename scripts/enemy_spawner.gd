extends Node2D

@export var nb_enemies = 6

@onready var Enemy = preload("res://scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var enemy = Enemy.instantiate()
	var v = get_viewport_rect().size
	var space = v.y / nb_enemies
	var pos = randi() % nb_enemies
	enemy.global_position = Vector2(v.x, space * (0.5+pos))
	add_child(enemy)
