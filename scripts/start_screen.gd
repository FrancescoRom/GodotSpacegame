extends Control

var level_scene: PackedScene = load ("res://scenes/level.tscn")

func _ready() -> void:
	Global.score = 0
	$IntroSound.play()


func _input(event):
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
	
