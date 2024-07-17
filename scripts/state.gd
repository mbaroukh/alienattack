extends Node

signal score_changed(score: int)
signal lifes_changed(lifes: int)

var score: int = 0
var lifes: int = 3
var difficulty: int = 2

func _ready():
	Events.ennemy_escaped.connect(func():
		addScore(-5)
	)
	Events.ennemy_killed.connect(func():
		addScore(+1)
	)
	Events.ennemy_hit_player.connect(func():
		decLifes()
	)

func addScore(v: int) -> void:
	score+=v
	if score<0:
		score=0
	emit_signal("score_changed", score)
	
func decLifes() -> void:
	lifes-=1
	emit_signal("lifes_changed", lifes)
	
func getScore() -> int:
	return score
	
func getLifes() -> int:
	return lifes
