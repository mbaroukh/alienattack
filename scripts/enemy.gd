extends Area2D

@export var speed = 300.0 * State.difficulty

func _physics_process(delta):	
	global_position.x-=delta*speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	Events.emit_signal("ennemy_escaped")
	queue_free()



func _on_body_entered(body):
	queue_free()
	Events.emit_signal("ennemy_hit_player")
