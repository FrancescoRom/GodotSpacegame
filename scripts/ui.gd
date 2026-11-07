extends CanvasLayer

static var image = load("res://SpaceShooterRedux/PNG/UI/playerLife1_blue.png")
var time_elapsed := 0

func _set_health(amount):
	# remove all children
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	# create new children based on hp
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _process(_delta: float) -> void:
		$MarginContainer/Label.text = str(Global.score)
