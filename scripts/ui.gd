extends Control

@onready var ScoreValueLabel = $ScoreValueLabel
@onready var ViesValueLabel = $ViesValueLabel

@export var initial_vies = 3
@export var initial_score = 0

func _ready():
	State.connect("lifes_changed", _on_lifes_changed)
	State.connect("score_changed", _on_score_changed)
	_on_lifes_changed(initial_vies)
	_on_score_changed(initial_score)
	
func _on_lifes_changed(v: int) -> void:
	ViesValueLabel.text=str(v)

func _on_score_changed(v: int) -> void:
	ScoreValueLabel.text=str(v)
