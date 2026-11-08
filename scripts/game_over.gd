extends Control

@export var level_scene: PackedScene

func _ready() -> void:
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)
	$GameOverSound.play()
	
func _input(event):
	if event.is_action_pressed("shoot"):
		Global.score = 0
		get_tree().change_scene_to_packed(level_scene)
	
