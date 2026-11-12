extends Control

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()


func _process(_delta: float) -> void:
	$MarginContainer/Label2.text = str(Global.score)
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused
