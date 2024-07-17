extends Node2D


func _ready():
	State.lifes_changed.connect(func (v):
		if v==0:
			$PlayerExplode.play()
	)
	Events.ennemy_killed.connect(func ():
		$EnemyHit.play()
	)

