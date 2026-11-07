extends Area2D


func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	# start pos
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = randi_range(0, width)
	var random_y = randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	# speed / rotation / direction
	
func _process(delta: float) -> void:
	position += Vector2(0, 1.0) * 400 * delta
	
	
func _on_body_entered(body: Node2D) -> void:
	print(body)
