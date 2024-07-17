extends Area2D


@export var speed = 300.0

func _physics_process(delta):	
	global_position.x+=delta*speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(enemy: Area2D) -> void:
	queue_free()
	enemy.queue_free()
	Events.emit_signal("ennemy_killed")
